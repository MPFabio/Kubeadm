output "Ressource_group_name" {
  value = module.ModuleP.Ressource_group_name
}

output "Environment" {
  value = module.ModuleP.Environment
}

output "The_subnet_ID" {
 value = module.ModuleP.The_subnet_ID
}

output "The_vnet_ID" {
 value = module.ModuleP.The_vnet_ID
}

output "The_kubeadm_Public_ip" {
   value = module.ModuleP.The_kubeadm_Public_ip
}

output "The_kubeadm_Private_ip" {
   value = module.ModuleP.The_kubeadm_Private_ip
}

output "tls_private_key" {
  value     = module.ModuleP.tls_private_key
  sensitive = false
}
