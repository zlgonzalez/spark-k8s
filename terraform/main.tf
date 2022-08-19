provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}


resource "helm_release" "spark-operator" {
  name       = "my-release"
  repository = "https://googlecloudplatform.github.io/spark-on-k8s-operator"
  chart      = "spark-operator"
  create_namespace = true
  replace = true
  namespace = "spark-operator"

  set {
    name = "image.tag"
    value = "v1beta2-1.3.3-3.1.1"
  }
  set {
    name = "sparkJobNamespace"
    value = "default"
  }
  set {
    name = "serviceAccounts.spark.name"
    value = "spark"
  }

}
