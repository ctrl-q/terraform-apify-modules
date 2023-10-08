variable "name" {
  type      = string
  sensitive = false
}
variable "is_enabled" {
  type      = bool
  sensitive = false
}
variable "is_exclusive" {
  type      = bool
  sensitive = false
}
variable "cron_expression" {
  type      = string
  sensitive = false
}
variable "timezone" {
  type      = string
  sensitive = false
}
variable "description" {
  type      = string
  sensitive = false
  default   = null
}
variable "actions" {
  type      = any
  sensitive = false
}
