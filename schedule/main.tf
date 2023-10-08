resource "restapi_object" "this" {
  path = "/schedules"
  data = jsonencode({
    name           = var.name,
    isEnabled      = var.is_enabled,
    isExclusive    = var.is_exclusive,
    cronExpression = var.cron_expression,
    timezone       = var.timezone,
    description    = var.description
    actions        = var.actions
  })
}

output "id" {
  value = restapi_object.this.id
}
