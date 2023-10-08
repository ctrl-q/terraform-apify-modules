variable "actor_id" {
  type      = string
  sensitive = false
}

variable "actor_version" {
  type      = string
  sensitive = false
}

variable "use_cache" {
  type      = bool
  default   = null
  sensitive = false
}

variable "tag" {
  type      = string
  default   = null
  sensitive = false
}

variable "beta_packages" {
  type      = bool
  default   = null
  sensitive = false
}

variable "wait_for_finish" {
  type      = number
  default   = null
  sensitive = false
}

variable "fingerprint" {
  type = string
  default = null
  description = "if this value changes, a build will be triggered"
  sensitive = false  
}