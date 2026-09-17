provider "kubernetes" {
  host = azurerm_kubernetes_cluster.aks.kube_config[0].host
  client_certificate = base64decode(
    azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  )
  client_key = base64decode(
    azurerm_kubernetes_cluster.aks.kube_config[0].client_key
  )
  cluster_ca_certificate = base64decode(
    azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
  )
}
provider "helm" {
  kubernetes = {
    host = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate = base64decode(
      azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
    )
    client_key = base64decode(
      azurerm_kubernetes_cluster.aks.kube_config[0].client_key
    )
    cluster_ca_certificate = base64decode(
    azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
  }
}

resource "helm_release" "nginx_ingress" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true


  values = [
    file("${path.module}/nginx-ingress-values.yaml")
  ]

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}

resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  version          = "..."
  create_namespace = true

  set = [
    {
      name  = "crds.enabled"
      value = "true"
    }
  ]

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}