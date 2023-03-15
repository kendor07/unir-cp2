# Configure the Azure provider
# Providers rarely need to change due to the fact that are provided by terraform
# the next lines are configure to work with Azure

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.10.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
