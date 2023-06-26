output "Ressource_group_name" {
  value = data.azurerm_resource_group.kubeadm.name
}

output "Environment" {
  value = var.environment
}

output "The_subnet_ID" {
 value = azurerm_subnet.kubeadm-subnet.id
}

output "The_vnet_ID" {
 value = azurerm_virtual_network.kubeadm-net.id
}

output "The_kubeadm_Private_ip" {
   value = azurerm_linux_virtual_machine.kubeadm.private_ip_address
}

output "The_kubeadm_Public_ip" {
   value = azurerm_linux_virtual_machine.kubeadm.public_ip_address
}

