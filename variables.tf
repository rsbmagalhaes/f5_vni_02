variable "ibmcloud_api_key" {
  type      = string
  sensitive = true
}

##################################################################################
# version - Terraform version required
##################################################################################
variable "TF_VERSION" {
  default     = "1.0"
  description = "terraform version required for schematics"
}

##################################################################################
# region - The VPC region to instatiate the F5 BIG-IP instance
##################################################################################
variable "region" {
  type        = string
  default     = "br-sao"
  description = "The VPC region to instatiate the F5 BIG-IP instance"
}

##################################################################################
# resource_group - The IBM Cloud resource group to create the F5 BIG-IP instance
##################################################################################
variable "resource_group" {
  type        = string
  default     = "RG-Tadeu"
  description = "The IBM Cloud resource group to create the F5 BIG-IP instance"
}

##################################################################################
# instance_name - The name of the F5 BIG-IP instance
##################################################################################
variable "instance_name" {
  type        = string
  default     = "f5-ve-01-vni-02"
  description = "The VPC Instance name"
}

##################################################################################
# hostname - The hostname of the F5 BIG-IP instance
##################################################################################
variable "hostname" {
  type        = string
  default     =  "f5-ve-01-vni-02"
  description = "The F5 BIG-IP hostname"
}

##################################################################################
# domain - The domain name of the F5 BIG-IP instance
##################################################################################
variable "domain" {
  type        = string
  default     = "local"
  description = "The F5 BIG-IP domain name"
}

##################################################################################
# tmos_custom_image - The custom VPC image to use for the F5 BIG-IP instnace
##################################################################################
variable "tmos_custom_image" {
  type        = string
  default     = ""
  description = "The custom VPC image to use for the F5 BIG-IP instance"
}

##################################################################################
# tmos_image_name - The longest match image name to use from the F5 public VE image catalog
##################################################################################
variable "tmos_image_name" {
  type        = string
  default     = "bigip-16-1"
  description = "The longest match image name to use from the F5 public VE image catalog"
}

##################################################################################
# tmos_type - The tmos image type. Either ltm or all
##################################################################################
variable "tmos_type" {
  type        = string
  description = "The tmos image type. Either ltm or all"
  default     = "all"
  validation {
    condition     = contains(["all", "ltm"], var.tmos_type)
    error_message = "Allowed values for tmos_type are \"all\" or \"ltm\"."
  }
}

##################################################################################
# instance_profile - The name of the VPC profile to use for the F5 BIG-IP instnace
##################################################################################
variable "instance_profile" {
  type        = string
  default     = "cx2-4x8"
  description = "The resource profile to be used when provisioning the F5 BIG-IP instance"
}

##################################################################################
# ssh_key_name - The name of the public SSH key to be used when provisining F5 BIG-IP
##################################################################################
variable "ssh_key_name" {
  type        = string
  sensitive   = true
  description = "The name of the public SSH key (VPC Gen 2 SSH Key) to be used when provisioning the F5 BIG-IP instance"
}

##################################################################################
# tmos_admin_password - The password for the built-in admin F5 BIG-IP user
##################################################################################
variable "tmos_admin_password" {
  type    = string
  default = "Dqn50vnc#"
  sensitive   = true
  description = "admin account password for the F5 BIG-IP instance"
}

##################################################################################
# management_subnet_id - The VPC subnet ID for the F5 BIG-IP management interface
##################################################################################
variable "management_subnet_id" {
  type = string
  default = "02t7-ddffa7cb-40d8-4a70-9075-0005851b92af"
  description = "Required VPC Gen2 subnet ID for the F5 BIG-IP management network"
}

##################################################################################
# bigip_management_floating_ip - Create a Floating IP for the management interface for BIG-IP
##################################################################################
variable "bigip_management_floating_ip" {
  type        = bool
  default     = false
  description = "Create a Floating IP for the management interface for BIG-IP"
}


##################################################################################
# cluster_subnet_id - The VPC subnet ID for the F5 BIG-IP configsync interface
##################################################################################
variable "cluster_subnet_id" {
  type        = string
  default     = null
  description = "Optional VPC Gen2 subnet ID for the F5 BIG-IP configsync activities"
}

##################################################################################
# internal_subnet_id - The VPC subnet ID for the F5 BIG-IP internal resources
##################################################################################
variable "internal_subnet_id" {
  type        = string
  default     = "02t7-ddffa7cb-40d8-4a70-9075-0005851b92af"
  description = "Optional VPC Gen2 subnet ID for the F5 BIG-IP access to internal resources"
}

##################################################################################
# external_subnet_id - The VPC subnet ID for the F5 BIG-IP virtual service listeners
##################################################################################
variable "external_subnet_id" {
  type = string
  default     = "02t7-ddffa7cb-40d8-4a70-9075-0005851b92af"
  description = "Required VPC Gen2 subnet ID for the F5 BIG-IP virtual service listeners"
}

##################################################################################
# bigip_external_floating_ip - Create a Floating IP for the external interface for BIG-IP
##################################################################################
variable "bigip_external_floating_ip" {
  type        = bool
  default     = false
  description = "Create a Floating IP for the external interface for BIG-IP"
}

##################################################################################
# default_route_interface - The F5 BIG-IP interface name for the default route
##################################################################################
variable "default_route_interface" {
  type        = string
  default     = ""
  description = "The F5 BIG-IP interface name for the default route. Leave blank to auto assign."
}


##################################################################################
# A&O Declaration Sources
##################################################################################
variable "license_type" {
  type        = string
  default     = "none"
  description = "How to license, may be 'none','byol','regkeypool','utilitypool'"
}
variable "byol_license_basekey" {
  type    = string
  default = ""
  #  sensitive   = true
  description = "Bring your own license registration key for the F5 BIG-IP instance"
}
variable "license_host" {
  type    = string
  default = ""
  #  sensitive   = true
  description = "BIGIQ IP or hostname to use for pool based licensing of the F5 BIG-IP instance"
}
variable "license_username" {
  type    = string
  default = ""
  #  sensitive   = true
  description = "BIGIQ username to use for the pool based licensing of the F5 BIG-IP instance"
}
variable "license_password" {
  type    = string
  default = ""
  #  sensitive   = true
  description = "BIGIQ password to use for the pool based licensing of the F5 BIG-IP instance"
}
variable "license_pool" {
  type        = string
  default     = ""
  description = "BIGIQ license pool name of the pool based licensing of the F5 BIG-IP instance"
}
variable "license_sku_keyword_1" {
  type        = string
  default     = ""
  description = "BIGIQ primary SKU for ELA utility licensing of the F5 BIG-IP instance"
}
variable "license_sku_keyword_2" {
  type        = string
  default     = ""
  description = "BIGIQ secondary SKU for ELA utility licensing of the F5 BIG-IP instance"
}
variable "license_unit_of_measure" {
  type        = string
  default     = "hourly"
  description = "BIGIQ utility pool unit of measurement"
}

variable "do_declaration_url" {
  type        = string
  default     = ""
  description = "URL to fetch the f5-declarative-onboarding declaration"
}
variable "as3_declaration_url" {
  type        = string
  default     = ""
  description = "URL to fetch the f5-appsvcs-extension declaration"
}
variable "ts_declaration_url" {
  type        = string
  default     = ""
  description = "URL to fetch the f5-telemetry-streaming declaration"
}

##################################################################################
# phone_home_url - The web hook URL to POST status to when F5 BIG-IP onboarding completes
##################################################################################
variable "phone_home_url" {
  type        = string
  default     = ""
  description = "The URL to POST status when BIG-IP is finished onboarding"
}

##################################################################################
# schematic template for phone_home_url_metadata
##################################################################################
variable "template_source" {
  default     = "f5devcentral/ibmcloud_schematics_bigip_multinic_declared"
  description = "The terraform template source for phone_home_url_metadata"
}
variable "template_version" {
  default     = "20210201"
  description = "The terraform template version for phone_home_url_metadata"
}
variable "app_id" {
  default     = "undefined"
  description = "The terraform application id for phone_home_url_metadata"
}

##################################################################################
# tgactive_url - The web hook URL to POST defined L3 addresses when tgactive is triggered
##################################################################################
variable "tgactive_url" {
  type        = string
  default     = ""
  description = "The URL to POST L3 addresses when tgactive is triggered"
}

##################################################################################
# tgstandby_url - The web hook URL to POST defined L3 addresses when tgstandby is triggered
##################################################################################
variable "tgstandby_url" {
  type        = string
  default     = ""
  description = "The URL to POST L3 addresses when tgstandby is triggered"
}

##################################################################################
# tgrefresh_url - The web hook URL to POST defined L3 addresses when tgrefresh is triggered
##################################################################################
variable "tgrefresh_url" {
  type        = string
  default     = ""
  description = "The URL to POST L3 addresses when tgrefresh is triggered"
}
##################################################################################
# encryption_key_crn - The crn of the encryption key for the boot volume
##################################################################################
variable "encryption_key_crn" {
  type    = string
  default = ""
  #  sensitive   = true
  description = "The crn of the encryption key"
}

###################################
### Adiçoes do MAGAL 01/03/2024 ###
###################################

##################################################################################
# Name for VNI F5 Management interface
##################################################################################
 variable "vni-mgmt-interface-name"{
   type = string
   default = "f5-vni-mgmt-if"
#   default = "${var.instance_name}-mgmt-if"
}

##################################################################################
# Name for VNI F5 External interface
##################################################################################
variable "vni-ext-interface-name"{
  type = string
   default = "f5-vni-ext-if"
#  default = "${var.instance_name}-ext-if"
}
# default = "${var.instance_name"mgmt-interfac

##################################################################################
# ID of Security Group for VNI Interfaces
##################################################################################
variable "security_group_id" {
  type    = string
  default= "r042-f2e9f449-6201-4c76-bf41-7cbb4e00a38b"
  description = "Security Group ID"
}

##########
#
##########
variable "management_reserved_ip" {
  type = string
  default = "mgmt-ip-02"
  description = "Reserved IP name" 
}

variable "external_reserved_ip" {
  type = string
  default = "external-ip-02"
  description = "Reserved IP name" 
}