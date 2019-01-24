output "cluster_api_url" {
  value = "${azurerm_kubernetes_cluster.aks.fqdn}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.aks.kube_config_raw}"
}
