resource "random_string" "service_pricipal_password" {
  length = 32
}

resource "azurerm_azuread_application" "kubernetes" {
  name = "aks-sp-${var.name}"
}

resource "azurerm_azuread_service_principal" "service_principal" {
  application_id = "${azurerm_azuread_application.kubernetes.application_id}"
}

resource "azurerm_azuread_service_principal_password" "service_principal" {
  service_principal_id = "${azurerm_azuread_service_principal.service_principal.id}"
  value                = "${random_string.service_pricipal_password.result}"
  end_date             = "${timeadd(timestamp(), "${24 * 365}h")}"

  lifecycle {
    ignore_changes = ["value", "end_date"]
  }
}

resource "azurerm_role_assignment" "contributor" {
  scope                = "${azurerm_resource_group.default.id}"
  role_definition_name = "Contributor"
  principal_id         = "${azurerm_azuread_service_principal.service_principal.id}"
}
