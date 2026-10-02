terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.8.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.9.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "f82c02a4-133c-4cca-8bb6-63a737a19432"
}