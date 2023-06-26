resource "azurerm_virtual_network" "kubeadm-net" {
  name                = "webserver-net"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.kubeadm
  resource_group_name = data.azurerm_resource_group.kubeadm
}

resource "azurerm_subnet" "kubeadm-subnet" {
  name                 = "subnet01"
  resource_group_name  = data.azurerm_resource_group.kubeadm
  virtual_network_name = azurerm_virtual_network.kubeadm-net.name
  address_prefixes       = ["10.0.0.0/24"]

  private_link_service_network_policies_enabled = false
}
