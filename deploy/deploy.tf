provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
    config_path = "~/.kube/config"
}

resource "kubernetes_service_v1" "hello-world-spring-boot" {
  metadata {
    name = "hello-world-spring-boot"
  }

  spec {
    selector = {
        app = "hello-world-spring-boot"
    }

    port {
      port = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_deployment_v1" "hello-world-spring-boot" {
  metadata {
    name = "hello-world-spring-boot"
    namespace = "default"
    labels = {
        app = "hello-world-spring-boot"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "hello-world-spring-boot"
      }
    }

    template {
      metadata {
        labels = {
            app = "hello-world-spring-boot"
        }
      }
      spec {
        container {
        name = "hello-world-spring-boot"
          image = "docker.io/mdottwo/terraform-hello-world:latest"
          port {
            container_port = 8080
          }
          image_pull_policy = "Never"
        }
      }
    }
  }
}