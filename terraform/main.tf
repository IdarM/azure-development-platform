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
  subscription_id = "296f8f53-3c22-4aac-b431-d257f6b30062"
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
