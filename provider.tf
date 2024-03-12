terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      #source = "terraform-stratus.com/ibm-cloud/ibm"

      #version = "1.30.2"
      version = "1.63.0"
      #version = "1.59.0-vnip2.1"

    }
  }
}

# Configure the IBM Provider
provider "ibm" {
  region           = var.region
  ibmcloud_api_key = var.ibmcloud_api_key
}

data "ibm_resource_group" "group" {
  name = var.resource_group
}
