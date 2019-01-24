resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.name}"
  location            = "${var.region}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  dns_prefix          = "aks-${var.name}"

  agent_pool_profile {
    name           = "worker"
    count          = "${var.worker_count}"
    vm_size        = "${lookup(local.vm_tshirt_size, var.tshirt_size)}"
    vnet_subnet_id = "${module.vnet.vnet_subnets[0]}"
  }

  service_principal {
    client_id     = "${azurerm_azuread_application.kubernetes.application_id}"
    client_secret = "${azurerm_azuread_service_principal_password.service_principal.value}"
  }
}
