resource "azurerm_virtual_machine" "Devops_VM" {
  name                  = "Devops_VM"
  location              = azurerm_resource_group.devops_rg.location
  resource_group_name   = azurerm_resource_group.devops_rg.name
  network_interface_ids = [azurerm_network_interface.Devops_Interface.id]
  vm_size               = "Standard_F2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name = "myosdisk1"
    #vhd_uri       = "${azurerm_storage_account.maddydevops.primary_blob_endpoint}${azurerm_storage_container.Devops_Storage_Container.name}/myosdisk1.vhd"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.computer_name
    admin_username = "testadmin"
    admin_password = var.admin_password

  }

  os_profile_linux_config {
    disable_password_authentication = false
    # ssh_keys {
    #   key_data = file("mykey.pub")
    #   path     = "/home/ubuntu/.ssh/authorized_keys"
    # }
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_virtual_machine_extension" "Devops_VM_ext" {
  name                 = "newvmext"
  virtual_machine_id   = azurerm_virtual_machine.Devops_VM.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  protected_settings   = <<PROT
  {
    "script": "${base64encode(file(var.scfile))}"
  }
  PROT

  #   settings = <<SETTINGS
  #     {
  #       "fileUris": ["https://maddydevops.blob.core.windows.net/content/custom_script.sh"],
  #       "commandToExecute": "chmod +x custom_script.sh && sh custom_script.sh",
  #       "skipDos2Unix": true
  #     }
  # SETTINGS

}

resource "azurerm_network_interface" "Devops_Interface" {
  name                = "acDevops_Interfacectni"
  location            = azurerm_resource_group.devops_rg.location
  resource_group_name = azurerm_resource_group.devops_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.Deveops_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.demo-instance.id
  }
}

resource "azurerm_public_ip" "demo-instance" {
  name                = "Devops_VM-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.devops_rg.name
  allocation_method   = "Dynamic"
}
