variable "actor_id" {
  type      = string
  sensitive = false
}

variable "name" {
  type      = string
  sensitive = false
}

variable "options" {
  default = null
  type    = any
}

variable "input" {
  type = any
}
