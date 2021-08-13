provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  }
}

resource "helm_release" "insprdaemon" {
  repository = "https://inspr-charts.storage.googleapis.com"
  chart      = "insprd"

  // deployment
  name      = var.release_name
  namespace = var.namespace
  create_namespace = true

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
    value = "${var.insprd_name}-${var.apps_namespace}"
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
    value = var.ingress_host
  }
  set {
    name = "ingress.class"
    value = var.ingress_class
  }


  // init
  set {
    name = "init.generateKey"
    value = var.init_generate_key
  }
  set { 
    name = "init.key"
    value = ""
  }

  // auth name
  set {
    name = "auth.name"
    value = "auth"
  }



  // CONSTANTS
  
  // svc constants
  set {
    name = "service.type"
    value = "ClusterIP"
  }
  set {
    name = "service.port"
    value = "80"
  }
  set {
    name = "service.targetPort"
    value = "8080"
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
    value = "3046"
  }
  set {
    name = "sidecar.ports.client.write"
    value = "3048"
  }
  set {
    name = "sidecar.ports.server.read"
    value = "3047"
  }
  set {
    name = "sidecar.ports.server.write"
    value = "3051"
  }


  // auth svc
  set {
    name = "auth.name"
    value = "auth"
  }
  // auth.service
  set {
    name = "auth.service.type"
    value = "ClusterIP"
  }
  set {
    name = "auth.service.port"
    value = 80 
  }
  set {
    name = "auth.service.targetPort"
    value = 8081
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

