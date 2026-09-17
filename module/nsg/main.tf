resource "azurerm_network_security_group" "database" {


  name = "database-nsg"


  location = var.location


  resource_group_name = var.resource_group_name



  security_rule {


    name = "allow-backend"


    priority = 100


    direction = "Inbound"


    access = "Allow"


    protocol = "Tcp"



    source_port_range = "*"


    destination_port_range = "3360"


    source_address_prefix = "10.0.2.0/24"


    destination_address_prefix = "*"


  }

}