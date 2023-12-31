# Configure terraform requirements for module
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.85.0"
    }
  }
  required_version = ">= 1.0"
}