#
# When executing these examples, be sure to cleanup the subscription afterwards
#

locals {
  resource_group_name = "rg-template-prod-eus"
  location            = "eus"
  environment         = "prod"

  tags = {
    "Contact"           = "john.doe@example.com"
    "Department"        = "Technology"
    "Terraform_Managed" = "Y"
  }
}

#
# Setup the Azure Provider
#

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

#
# Create the Resource Group
#

resource "azurerm_resource_group" "this" {
  name     = local.resource_group_name
  location = local.location
  tags     = local.tags
}

#
# Provision a Azure Resource(s) using a Module
#

module mytemplate {
  source = "../../azurerm/template"

  providers = {
    azurerm = azurerm
  }

  resource_group_name = azurerm_resource_group.this.name
  location            = local.location
  environment         = local.environment

  name = "template"

  tags = local.tags
}