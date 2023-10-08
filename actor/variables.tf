variable "name" {
  type      = string
  sensitive = false
}
variable "description" {
  default = null
  type    = string
}

variable "actor_permission_level" {
  default = null
  type    = string
}
variable "title" {
  default = null
  type    = string
}
variable "seo_title" {
  default = null
  type    = string
}
variable "seo_description" {
  default = null
  type    = string
}
variable "restart_on_error" {
  default = false
  type    = bool
}
variable "is_public" {
  default = false
  type    = bool
}
variable "categories" {
  default = null
  type    = list(string)
}
variable "default_run_options" {
  default = null
  type = object({
    build         = string
    timeout_secs  = number
    memory_mbytes = number
  })
}
variable "versions" {
  type = list(object({
    version_number          = string
    env_vars                = optional(map(string), {})
    apply_env_vars_to_build = optional(bool, false)
    build_tag               = string
    git_repo_url            = optional(string)
    source_type             = optional(string, "SOURCE_FILES")
    source_files = optional(list(object({
      name    = string,
      format  = string,
      content = string
    })), [])
    source_directory     = optional(string)
    source_file_patterns = optional(list(string), ["**"])
  }))
}

variable "actor_standby" {
  default = null
  type = object({
    is_enabled                     = optional(bool, false)
    max_requests_per_actor_run     = optional(number)
    desired_requests_per_actor_run = optional(number)
    idle_timeout_secs              = optional(number)
    build                          = optional(string, "latest")
    memory_mbytes                  = optional(number)
    should_pass_actor_input        = optional(bool)
  })
}

variable "trigger_build_on_file_change" {
  type    = bool
  default = false
}
