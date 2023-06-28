module "ModuleP" {
  source = "../kubeadm"
  instance_size = "Standard_D2ds_v4"
  location = "francecentral"
  environment = "Worker01"
}

resource "azurerm_resource_group" "kubeadm" {
   name = "kubeadm-fabio"
   location = var.location
}
