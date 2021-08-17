// deployment
variable "release_name" {
  description = "name of the release of the inspr daemon"
  type = string
  default = "insprd"
}
variable "namespace" {
  description = "namespace in which the daemon components will be deployed to"
  type = string
  default = "inspr"
}


// insprd svc
variable "insprd_name" {
  description = "name of the daemon service"
  type = string
  default = "insprd"
}
variable "insprd_svc_type" {
  description = "specifies the type of the daemon service"
  type = string
  default = "ClusterIP"
}
variable "insprd_svc_port" {
  description = "specifies the port of the daemon service"
  type = number
  default = 80
}
variable "insprd_svc_targetPort" {
  description = "specifies the targetPort of the daemon service"
  type = number
  default = 8080
}

variable "image_pull_policy" {
  description = "definition of the image policy for the pods"
  type = string
  default = "IfNotPresent"
}
variable "replica_count" {
  description = "number of replicas of the pods associated with the inspr daemon"
  type = number
  default = 1
}
variable "log_level" {
  description = "initial level of the daemon logger, can be changed via insprctl"
  type = string
  default = "info"
}

// sidecar
/// client
variable "sidecar_client_read_port" {
  description = "specifies the port in which the sidecar client will read from"
  type = number
  default = 3046
}
variable "sidecar_client_write_port" {
  description = "specifies the port in which the sidecar client will write to"
  type = number
  default = 3048
}
/// server
variable "sidecar_server_read_port" {
  description = "specifies the port in which the sidecar server will read from"
  type = number
  default = 3047
}
variable "sidecar_server_write_port" {
  description = "specifies the port in which the sidecar server will write to"
  type = number
  default = 3051
}



// auth svc
variable "auth_name" {
  description = "name of the auth service"
  type = string
  default = "auth"
}
variable "auth_svc_type" {
  description = "specifies the type of the auth service"
  type = string
  default = "ClusterIP"
}
variable "auth_svc_port" {
  description = "specifies the port of the auth service"
  type = number
  default = 80
}
variable "auth_svc_targetPort" {
  description = "specifies the targetPort of the auth service"
  type = number
  default = 8081
}


// images related
variable "image_registry" {
  description = "url for the insprlabs image repository"
  type = string
  default  = "gcr.io/insprlabs"
}
variable "image_tag" {
  description = "tag of the image that the deployment will use, allows to specify a specific version of the daemon"
  type = string
  default = "latest"
}


variable "apps_namespace" {
  description = "namespace in which the dapps will be created in."
  type = string
}
variable "create_apps_namespace" {
  description = "enable the creation of the dapps-namespace, in case it doens't exist"
  type = bool
  default = true
}


// ingress
variable "enable_ingress" {
  description = "enables the ingress of the insprd"
  type = bool
  default = false
}
variable "ingress_host" {
  description = "host of the ingress, only used if the enable_ingress is set as true"
  type = string
  default = ""
}
variable "ingress_class" {
  description = "class of the ingress, only used if the enable_ingress is set as true"
  type = string
  default = ""
}


// init
variable "init_generate_key" {
  description = "enables the creation of the init key, used for the authentication process of the inspr daemon"
  type = bool
  default = true
}
variable "init_key" {
  description = "reponsible for setting the init_key in case the you don't want a random key"
  type = string
  default = ""
}

