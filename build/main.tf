resource "restapi_object" "this" {
  path = "/acts/${var.actor_id}/builds"
  force_new = [ var.fingerprint == null ? "" : var.fingerprint ]
  lifecycle {
    create_before_destroy = true
  }
  query_string = join("&", compact([
    "version=${urlencode(var.actor_version)}",
    var.use_cache != null ? "useCache=${urlencode(var.use_cache)}" : "",
    var.beta_packages != null ? "betaPackages=${urlencode(var.beta_packages)}" : "",
    var.tag != null ? "tag=${urlencode(var.tag)}" : "",
    var.wait_for_finish != null ? "waitForFinish=${urlencode(var.wait_for_finish)}" : ""
  ]))
  data = ""
}

output "id" {
  value = restapi_object.this.id
}
