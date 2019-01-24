module "vnet" {
  source              = "Azure/vnet/azurerm"
  vnet_name           = "aks-${var.name}"
  resource_group_name = "${azurerm_resource_group.default.name}"
  location            = "${var.region}"
  address_space       = "192.168.0.0/16"
  subnet_prefixes     = ["192.168.8.0/24"]
  subnet_names        = ["default"]
}
