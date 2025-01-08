# Terraform configuration file

# Specify the required Terraform version
terraform {
  required_version = ">= 0.12"
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Define backend configuration (optional)
# backend "azurerm" {
#   resource_group_name  = "example-resources"
#   storage_account_name = "examplestorage"
#   container_name       = "tfstate"
#   key                  = "terraform.tfstate"
# }

# Define variables (optional)
variable "location" {
  description = "The Azure region to deploy resources in"
  default     = "West US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "example-resources"
}

# Define output values (optional)
output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}
