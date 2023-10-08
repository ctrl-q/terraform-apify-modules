resource "restapi_object" "this" {
  path = "/key-value-stores"
  data = jsonencode({
    name = var.name
  })
  query_string = "name=${urlencode(var.name)}"
}

output "id" {
  value = restapi_object.this.id
}
