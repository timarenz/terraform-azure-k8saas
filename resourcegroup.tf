resource "azurerm_resource_group" "default" {
  name     = "aks-${var.name}"
  location = "${var.region}"
}
