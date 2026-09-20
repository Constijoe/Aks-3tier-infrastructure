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
  type = string
}
variable "public_subnet_cidr" {
  type = string
}
variable "private_subnet_cidr" {
  type = string
}
variable "db_username" {
}
variable "db_password" {
}
variable "client_id" {
  type      = string
  sensitive = true
}
variable "client_secret" {
  type      = string
  sensitive = true
}
variable "tenant_id" {
  type      = string
  sensitive = true
}
variable "subscription_id" {
  type      = string
  sensitive = true
}
