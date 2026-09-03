variable "env" {
  type = string
}
variable "name" {
  type = string
}
variable "virtual_network_name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
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