provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "hello-world" {
    name = "terraform-hello-world"
    chart = "./helm"
    namespace = "default"
}