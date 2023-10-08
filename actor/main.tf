locals {
  description = coalesce(var.description, var.name)
  title       = coalesce(var.title, var.name)
  filenames = {
    for version in var.versions : version.version_number => version.source_directory == null ? [] : flatten([
      for pattern in version.source_file_patterns : [
        fileset(version.source_directory, pattern)
    ]])
  }
}
resource "restapi_object" "this" {
  path = "/acts"
  data = jsonencode({
    name                 = var.name
    description          = local.description
    title                = local.title
    actorPermissionLevel = var.actor_permission_level
    seoTitle             = var.seo_title
    seoDescription       = var.seo_description
    restartOnError       = var.restart_on_error
    isPublic             = var.is_public
    categories           = var.categories
    defaultRunOptions = {
      build        = var.default_run_options.build
      timeoutSecs  = var.default_run_options.timeout_secs
      memoryMbytes = var.default_run_options.memory_mbytes
    }
    versions = [
      for version in var.versions :
      {
        versionNumber       = version.version_number
        sourceType          = version.source_type
        applyEnvVarsToBuild = version.apply_env_vars_to_build
        buildTag            = version.build_tag
        gitRepoUrl          = version.git_repo_url
        sourceFiles = length(version.source_files) != 0 ? version.source_files : [
          for name in local.filenames[version.version_number] : {
            name    = name
            format  = "TEXT"
            content = file("${version.source_directory}/${name}")
          }
        ]
      }
    ]
    actorStandby = var.actor_standby == null ? null : {
      isEnabled                  = var.actor_standby.is_enabled
      maxRequestsPerActorRun     = var.actor_standby.max_requests_per_actor_run
      desiredRequestsPerActorRun = var.actor_standby.desired_requests_per_actor_run
      idleTimeoutSecs            = var.actor_standby.idle_timeout_secs
      build                      = var.actor_standby.build
      memoryMbytes               = var.actor_standby.memory_mbytes
      shouldPassActorInput       = var.actor_standby.should_pass_actor_input
    }
  })
}

module "build" {
  source   = "../build"
  for_each = var.trigger_build_on_file_change ? { for version in var.versions : version.version_number => version } : {}
  fingerprint = sha256(join("", flatten([
    for name in local.filenames[each.value.version_number] : file("${each.value.source_directory}/${name}")
  ])))
  actor_id        = restapi_object.this.id
  wait_for_finish = 180
  actor_version   = each.key
}

output "id" {
  value = restapi_object.this.id
}

output "title" {
  value = local.title
}
