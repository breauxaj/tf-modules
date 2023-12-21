#
# Resource local variables
#

locals {
  # structured name builder, ex: tmp-sample-prod-eus
  template_name = join("-", ["tmp", var.name, var.environment, var.location])

  tags = merge(
    { "Created" = timestamp() },
    var.tags
  )
}

#
# Resource to be created
#

resource "azurerm_template" "this" {
  name                = local.template_name
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = local.tags
}

#
# Output(s) of Resource, where applicable
#

output "id" {
  value = data.azurerm_template.this.id
}

output "name" {
  value = data.azurerm_template.this.name
}