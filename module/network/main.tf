resource "azurerm_virtual_network" "vnet" {

  name     = var.virtual_network_name
  location = var.resource_group_location

  resource_group_name = var.resource_group_name


  address_space = [var.address_space]
  tags = {
    environment = "var.env"
  }
}

resource "azurerm_subnet" "public" {

  name = "${var.env}-public"

  resource_group_name = var.resource_group_name

  virtual_network_name = azurerm_virtual_network.vnet.name


  address_prefixes = [var.public_subnet_cidr]
}



resource "azurerm_subnet" "private" {

  name = "${var.env}-subnet"


  resource_group_name = var.resource_group_name


  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [var.private_subnet_cidr]

}