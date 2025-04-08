provider "azurerm" {
  features {}

  client_id       = "0f687c5d-c508-4681-b598-37b5dbd610b4"
  client_secret   = "U-O8Q~pTj-~m1LA6SZkuch71F-ePyLz1wEgLubi1"
  subscription_id = "1ecb68ad-b9f1-4f6e-8e63-c0e1d3d46c33"
  tenant_id       = "c6deabb2-d214-4e9d-89f2-4013cd97071f"
}

resource "azurerm_resource_group" "this" {
  name     = "rg-jenkins"
  location = var.location
}

resource "azurerm_service_plan" "this" {
  name                = "appserviceplan-jenkins"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  os_type             = "Linux"

  sku_name = "B1"
}

resource "azurerm_linux_web_app" "this" {
  name                = "Dushyant123"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_id     = azurerm_service_plan.this.id  # Updated attribute

  site_config {
    always_on = true
  }
}
