module "ModuleP" {
  source = "../kubeadm"
  instance_size = "Standard_D2ds_v4"
  location = "francecentral"
  environment = "Master"
}
