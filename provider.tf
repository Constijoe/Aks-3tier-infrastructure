terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "5.11.0"
    }
  }
}


provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id


}
