resource "azurerm_public_ip" "kubeadm_public_ip" {
   name = "kubeadm_public_ip"
   location = var.location
   resource_group_name = data.azurerm_resource_group.kubeadm
   allocation_method = "Dynamic"

   tags = {
       environment = var.environment
       costcenter = "it"
   }

   depends_on = [data.azurerm_resource_group.kubeadm]
}

resource "azurerm_network_interface" "kubeadm" {
   name = "kubeadm-interface"
   location = data.azurerm_resource_group.kubeadm
   resource_group_name = data.azurerm_resource_group.kubeadm

   ip_configuration {
       name = "internal"
       private_ip_address_allocation = "Dynamic"
       subnet_id = azurerm_subnet.kubeadm-subnet.id
       public_ip_address_id = azurerm_public_ip.kubeadm_public_ip.id
   }

   depends_on = [data.azurerm_resource_group.kubeadm]
}

resource "azurerm_linux_virtual_machine" "kubeadm" {
   size = var.instance_size
   name = "kubeadm${var.environment}"
   resource_group_name = data.azurerm_resource_group.kubeadm
   location = data.azurerm_resource_group.kubeadm
   custom_data = base64encode(file("../kubeadm/init-script.sh"))
   network_interface_ids = [
       azurerm_network_interface.kubeadm.id,
   ]

   source_image_reference {
       offer = "0001-com-ubuntu-server-focal"
       publisher = "Canonical"
       sku = "20_04-lts-gen2"
       version = "latest"
   }

   computer_name = "kubeadm${var.environment}"
   admin_username = "fabio"
   admin_password = "Azerty-123"
   disable_password_authentication = false

   os_disk {
       name = "kubeadmdisk${var.environment}"
       caching = "ReadWrite"
       #create_option = "FromImage"
       storage_account_type = "Standard_LRS"
   }

   tags = {
       environment = var.environment
       costcenter = "it"
   }

   depends_on = [data.azurerm_resource_group.kubeadm]
}
