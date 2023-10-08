resource "restapi_object" "this" {
  path = "/actor-tasks"
  data = jsonencode({
    actId   = var.actor_id
    name    = var.name
    options = var.options
    input   = var.input
  })
}

output "id" {
  value = restapi_object.this.id
}

output "name" {
  value = jsondecode(restapi_object.this.api_response).data.name
}
