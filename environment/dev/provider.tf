
 terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {
   features {}
   subscription_id = "afd16d4c-a9a7-4226-a637-b843d1e25f1e"
   
}