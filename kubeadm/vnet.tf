resource "azurerm_virtual_network" "kubeadm-net" {
  name                = "vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.kubeadm.location
  resource_group_name = azurerm_resource_group.kubeadm.name
}

resource "azurerm_subnet" "kubeadm-subnet" {
  name                 = "subnet01"
  resource_group_name  = azurerm_resource_group.kubeadm.name
  virtual_network_name = azurerm_virtual_network.kubeadm-net.name
  address_prefixes       = ["10.0.0.0/24"]

  private_link_service_network_policies_enabled = false
}
