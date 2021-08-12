// deployment
variable "release_name" {
  description = ""
  type = string
  default = "insprd"
}
variable "namespace" {
  description = ""
  type = string
  default = "inspr"
}


// insprd svc
variable "insprd_name" {
  description = ""
  type = string
  default = "insprd"
}
variable "image_pull_policy" {
  description = ""
  type = string
  default = "IfNotPresent"
}
variable "replica_count" {
  description = ""
  type = number
  default = 1
}
variable "log_level" {
  description = ""
  type = string
  default = "info"
}


// images related
variable "image_registry" {
  description = ""
  type = string
  default  = "gcr.io/insprlabs"
}
variable "image_tag" {
  description = ""
  type = string
  default = "latest"
}


variable "apps_namespace" {
  description = ""
  type = string
}
variable "create_apps_namespace" {
  description = ""
  type = bool
  default = true
}


// ingress
variable "enable_ingress" {
  description = ""
  type = bool
  default = false
}
variable "ingress_host" {
  description = ""
  type = string
  default = ""
}
variable "ingress_class" {
  description = ""
  type = string
  default = ""
}


// init
variable "init_generate_key" {
  description = ""
  type = bool
  default = true
}
variable "init_key" {
  description = ""
  type = string
  default = ""
}

