##### VCN #####
resource "oci_core_vcn" "shukawam_vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = local.cidr_block
  display_name   = "shukawam-vcn"
  dns_label      = local.prefix
}

##### Gateway #####
resource "oci_core_internet_gateway" "shukawam_internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.shukawam_vcn.id
  display_name   = format("%s-internet-gateway", local.prefix)
}

resource "oci_core_nat_gateway" "shukawam_nat_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.shukawam_vcn.id
  display_name   = format("%s-nat-gateway", local.prefix)
}

resource "oci_core_service_gateway" "shukawam_service_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.shukawam_vcn.id
  display_name   = format("%s-service-gateway", local.prefix)
  services {
    service_id = local.all_services.id
  }
}

##### Route Table #####
resource "oci_core_default_route_table" "public_route_table" {
  manage_default_resource_id = oci_core_vcn.shukawam_vcn.default_route_table_id
  compartment_id             = var.compartment_ocid
  display_name               = format("%s-public-route-table", local.prefix)
  route_rules {
    destination       = local.cidr_block_all
    destination_type  = local.destination_type_cidr
    network_entity_id = oci_core_internet_gateway.shukawam_igw.id
  }
}

##### Security Lists #####
resource "oci_core_security_list" "shukawam_pub_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.shukawam_vcn.id
  display_name   = format("%s-private-route-table", local.prefix)
  ingress_security_rules {
    protocol = local.protocol_tcp
    source   = local.cidr_block_all
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_icmp
    source   = local.cidr_block_all
    icmp_options {
      type = "3"
      code = "4"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_icmp
    source   = local.cidr_block
    icmp_options {
      type = "3"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_tcp
    source   = local.cidr_block_all
    tcp_options {
      max = "9200"
      min = "9200"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_tcp
    source   = local.cidr_block_all
    tcp_options {
      max = "5601"
      min = "5601"
    }
  }
  egress_security_rules {
    description = "Allow trafic for all ports"
    destination = local.cidr_block_all
    protocol    = local.protocol_all
  }
}

resource "oci_core_security_list" "shukawam_pri_sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.shukawam_vcn.id
  display_name   = "shukawam-private-security-list"
  ingress_security_rules {
    protocol = local.protocol_tcp
    source   = local.cidr_block
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_icmp
    source   = local.cidr_block_all
    icmp_options {
      type = "3"
      code = "4"
    }
  }
  ingress_security_rules {
    protocol = local.protocol_icmp
    source   = local.cidr_block
    icmp_options {
      type = "3"
    }
  }
  egress_security_rules {
    description = "Allow trafic for all ports"
    destination = local.cidr_block_all
    protocol    = local.protocol_all
  }
}


##### Subnet #####
resource "oci_core_subnet" "shukawam_public_subnet" {
  cidr_block                 = local.cidr_block_public_subnet
  compartment_id             = var.compartment_ocid
  vcn_id                     = oci_core_vcn.shukawam_vcn.id
  security_list_ids          = [oci_core_security_list.shukawam_pub_sl.id]
  display_name               = "shukawam-public-subnet"
  route_table_id             = oci_core_vcn.shukawam_vcn.default_route_table_id
  prohibit_public_ip_on_vnic = false
  dns_label                  = format("%s-public", local.prefix)
}

resource "oci_core_subnet" "shukawam_private_subnet" {
  cidr_block        = local.cidr_block_private_subnet
  compartment_id    = var.compartment_ocid
  vcn_id            = oci_core_vcn.shukawam_vcn.id
  security_list_ids = [oci_core_security_list.shukawam_pri_sl.id]
  display_name      = "shukawam-private-subnet"
  route_table_id    = oci_core_vcn.shukawam_vcn.default_route_table_id
  dns_label         = format("%s-private", local.prefix)
}
