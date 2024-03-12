#######################################################
### F5 Multiple VNIs - Rodrigo Magalhaes 01/03/2024 ###
#######################################################

resource "ibm_is_virtual_network_interface" "rip_vnic_vsi" {
  allow_ip_spoofing         = false
  auto_delete               = false
  enable_infrastructure_nat = true
  name                      = var.vni-mgmt-interface-name
  subnet                    = var.management_subnet_id
  security_groups           = [var.security_group_id]
  resource_group            = data.ibm_resource_group.group.id
  primary_ip {
    reserved_ip = ibm_is_subnet_reserved_ip.rip_vnic_vsi.reserved_ip
  }
}

resource "ibm_is_subnet_reserved_ip" "rip_vnic_vsi" {
  subnet = var.management_subnet_id
  name   = var.management_reserved_ip
}

#resource "ibm_is_virtual_network_interface" "rip_vnic2_vsi" {
#  allow_ip_spoofing         = false
#  auto_delete               = false
#  enable_infrastructure_nat = true
#  name                      = "internal01"
#  subnet                    = var.internal_subnet_id
#  security_groups           = [var.security_group_id]
#  primary_ip {
#    reserved_ip = ibm_is_subnet_reserved_ip.rip_vnic2_vsi.reserved_ip
#  }
  #   ips{
  #     reserved_ip = ibm_is_subnet_reserved_ip.rip_vnic2_vsi-2.reserved_ip
  #   }
#}

#resource "ibm_is_subnet_reserved_ip" "rip_vnic2_vsi" {
#  subnet = var.internal_subnet_id
#  name   = var.
#}#

resource "ibm_is_virtual_network_interface" "rip_vnic3_vsi" {
  allow_ip_spoofing         = true
  auto_delete               = false
  enable_infrastructure_nat = true
  name                      = var.vni-ext-interface-name
  subnet                    = var.external_subnet_id
  security_groups           = [var.security_group_id]
  resource_group            = data.ibm_resource_group.group.id
  primary_ip {
    reserved_ip = ibm_is_subnet_reserved_ip.rip_vnic3_vsi.reserved_ip
  }
  #   ips{
  #     reserved_ip = ibm_is_subnet_reserved_ip.rip_vnic3_vsi-2.reserved_ip
  #   }
}

resource "ibm_is_subnet_reserved_ip" "rip_vnic3_vsi" {
  subnet = var.external_subnet_id
  name   = var.external_reserved_ip
}
