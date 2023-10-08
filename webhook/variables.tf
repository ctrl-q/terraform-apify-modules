variable "is_adhoc" {
  type      = bool
  default   = null
  sensitive = false
}
variable "action_type" {
  type      = string
  default   = null
  sensitive = false
}
variable "google_drive" {
  type = object({
    userIntegrationId = string
    filename          = string
    format            = string
  })
  default = null
}
variable "event_types" {
  type      = list(string)
  sensitive = false
}
variable "condition" {
  type = object({
    actor_task_id = string
  })
  sensitive = false
}
variable "idempotency_key" {
  type      = string
  default   = null
  sensitive = false
}
variable "ignore_ssl_errors" {
  type      = bool
  default   = null
  sensitive = false
}
variable "do_not_retry" {
  type      = bool
  default   = null
  sensitive = false
}
variable "request_url" {
  type      = string
  default   = null
  sensitive = false
}
variable "payload_template" {
  type      = string
  default   = null
  sensitive = false
}
variable "headers_template" {
  type      = string
  default   = null
  sensitive = false
}
variable "description" {
  type      = string
  default   = null
  sensitive = false
}
variable "should_interpolate_strings" {
  type      = bool
  default   = null
  sensitive = false
}
variable "is_apify_integration" {
  type      = bool
  default   = null
  sensitive = false

}
