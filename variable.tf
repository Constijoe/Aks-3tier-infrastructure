variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "env" {
  type = string
}
variable "virtual_network_name" {
  type = string
}
  variable "address_space" {
    type = set()
  }
  variable "public_subnet_cidr" {
    type = set()
  }
  variable "private_subnet_cidr" {
    type = set()
  }
  variable "db_username" {
  }
  variable "db_password" {
  }
  variable "client_id" {}
  variable "client_secret" {}
  variable "tenant_id" {}
  variable "subscription_id" {}