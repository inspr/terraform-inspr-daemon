terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }
}

resource "helm_release" "insprdaemon" {
  repository = "https://inspr-charts.storage.googleapis.com"
  chart      = "insprd"

  // deployment
  name      = var.release_name
  namespace = var.namespace
  create_namespace = true

  // waits for all jobs to be done in cluster
  wait = true
  wait_for_jobs = true

  // insprd svc
  set {
    name = "name"
    value = var.insprd_name
  }
  set {
    name = "imagePullPolicy"
    value = var.image_pull_policy
  }
  set {
    name = "replicaCount"
    value = var.replica_count
  }
  set {
    name = "logLevel"
    value = var.log_level
  }
  
  // insprd svc config
  set {
    name = "service.type"
    value = var.insprd_svc_type
  }
  set {
    name = "service.port"
    value = var.insprd_svc_port
  }
  set {
    name = "service.targetPort"
    value = var.insprd_svc_targetPort
  }

  // image section
  set {
    name = "image.registry"
    value = var.image_registry
  }
  set {
    name = "image.repository"
    value = "insprd"
  }
  set {
    name = "image.tag"
    value = var.image_tag
  }

  // apps sections
  set {
    name = "apps.namespace"
    value = var.apps_namespace
  }
  set {
    name = "apps.createNamespace"
    value = var.create_apps_namespace
  }

  // ingress
  set {
    name = "ingress.enabled"
    value = var.enable_ingress
  }
  set {
    name = "ingress.host"
    value = var.enable_ingress == true ? var.ingress_host : ""
  }
  set {
    name = "ingress.class"
    value = var.enable_ingress == true ? var.ingress_class : ""
  }

  // init
  set {
    name = "init.generateKey"
    value = var.init_generate_key
  }
  set { 
    name = "init.key"
    value = var.init_generate_key == true ? "" : var.init_key
  }

  // sidecar
  // sidecar.image section
  set {
    name = "sidecar.image.registry"
    value = var.image_registry
  }
  set {
    name = "sidecar.image.repository"
    value = "inspr/sidecar/lbsidecar"
  }
  set {
    name = "sidecar.image.tag"
    value = var.image_tag
  }
  // sidecar.ports section
  set {
    name = "sidecar.ports.client.read"
    value = var.sidecar_client_read_port
  }
  set {
    name = "sidecar.ports.client.write"
    value = var.sidecar_client_write_port
  }
  set {
    name = "sidecar.ports.server.read"
    value = var.sidecar_server_read_port
  }
  set {
    name = "sidecar.ports.server.write"
    value = var.sidecar_server_write_port
  }

  // auth svc
  set {
    name = "auth.name"
    value = var.auth_name
  }
  set {
    name = "auth.service.type"
    value = var.auth_svc_type
  }
  set {
    name = "auth.service.port"
    value = var.auth_svc_port 
  }
  set {
    name = "auth.service.targetPort"
    value = var.auth_svc_targetPort
  }
  //auth.image
  set {
    name = "auth.image.registry"
    value = var.image_registry
  }
  set {
    name = "auth.image.repository"
    value = "authsvc"
  }
  set {
    name = "auth.image.tag"
    value = var.image_tag
  } 
  
  // secret generator
  set {
    name = "secretGenerator.image.registry"
    value = var.image_registry
  }
  set {
    name = "secretGenerator.image.repository"
    value = "secretgen"
  }
  set {
    name = "secretGenerator.image.tag"
    value = var.image_tag
  }
}

