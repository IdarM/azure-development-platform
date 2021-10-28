# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstateewecm"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
