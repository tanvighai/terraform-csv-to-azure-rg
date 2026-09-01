terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.3.0"
    }
  }

  # backend "azurerm" {
  #     resource_group_name = "rg-terraform-state"
  #     storage_account_name = "stterraformstate00"
  #     container_name = "tfstatecontainer001"
  #     key = "tfstatevistar001"
  # }

}

provider "azurerm" {
  features {}
  subscription_id = "db01d82e-c301-43db-85a5-0174b78a7d18 "
}