module "resource_group" {
  source   = "./module/R_group"
  name     = var.name
  location = var.location
}

module "network" {
  source               = "./module/network"
  name                 = var.name
  env                  = var.env
  virtual_network_name = var.virtual_network_name

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = var.address_space

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

}

module "database" {
  source              = "./module/database"
  env                 = var.env
  name                = var.name
  db_password         = var.db_password
  db_username         = var.db_username
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  private_subnet_id   = module.network.private_subnet_id
  vnet_id             = module.network.vnet_id
}
module "aks" {
  source              = "./module/aks"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  name = var.name
  env = var.env
  aks_version =  "1.33"
  vnet_id = module.network.vnet_id


}