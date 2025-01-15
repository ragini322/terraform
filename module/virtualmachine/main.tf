
data "azurerm_network_interface" "datanic" {
  for_each = var.childvm
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_linux_virtual_machine" "childvm" {
  for_each = var.childvm
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "Ragini@123"
  disable_password_authentication = "true"

  network_interface_ids = [
    data.azurerm_network_interface.datanic[each.key].id,
  ]

  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
