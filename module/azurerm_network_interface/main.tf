data "azurerm_subnet" "datasub" {
    for_each = var.nic
  name                 = each.value.subnetname
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

   resource "azurerm_network_interface" "nic" {
  for_each = var.nic

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.datasub[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}