resource "azurerm_resource_group" "kubeadm" {
   name = "kubeadm-fabio"
   location = var.location
}
