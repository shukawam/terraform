resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = local.cidr_block.vcn
  display_name   = format("%s-vcn", var.prefix)
  dns_label      = local.dns_label.vcn
  freeform_tags  = local.freeform_tags
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-internet-gateway", var.prefix)
  freeform_tags  = local.freeform_tags
}

resource "oci_core_nat_gateway" "nat_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-nat-gateway", var.prefix)
  freeform_tags  = local.freeform_tags
}

resource "oci_core_service_gateway" "service_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-service-gateway", var.prefix)
  services {
    service_id = local.all_services.id
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_default_route_table" "public_route_table" {
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  compartment_id             = var.compartment_ocid
  display_name               = format("%s-default-route-table", var.prefix)
  route_rules {
    destination       = local.cidr_block.all
    destination_type  = local.destination_type.cidr_block
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_route_table" "private_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-private-route-table", var.prefix)
  route_rules {
    destination       = local.all_services.cidr_block
    destination_type  = local.destination_type.service_cidr_block
    network_entity_id = oci_core_service_gateway.service_gateway.id
  }
  route_rules {
    destination       = local.cidr_block.all
    destination_type  = local.destination_type.cidr_block
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_default_security_list" "default_security_list" {
  manage_default_resource_id = oci_core_vcn.vcn.default_security_list_id
  compartment_id             = var.compartment_ocid
  display_name               = format("%s-default-security-list", var.prefix)
  ingress_security_rules {
    protocol    = local.protocol.tcp
    source      = local.cidr_block.all
    source_type = local.source_type.cidr_block
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    protocol    = local.protocol.icmp
    source      = local.cidr_block.all
    source_type = local.source_type.cidr_block
    stateless   = "false"
    icmp_options {
      type = "3"
      code = "4"
    }
  }
  ingress_security_rules {
    protocol    = local.protocol.icmp
    source      = local.cidr_block.vcn
    source_type = local.source_type.cidr_block
    stateless   = "false"
    icmp_options {
      type = "3"
    }
  }
  egress_security_rules {
    destination      = local.cidr_block.all
    destination_type = local.destination_type.cidr_block
    protocol         = local.protocol.all
    stateless        = "false"
  }
  egress_security_rules {
    destination      = local.all_services.cidr_block
    destination_type = local.destination_type.service_cidr_block
    protocol         = local.protocol.all
    stateless        = "false"
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_security_list" "custom_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = format("%s-custom-security-list", var.prefix)
  ingress_security_rules {
    description = "HTTPS"
    protocol    = local.protocol.tcp
    source      = local.cidr_block.all
    tcp_options {
      max = "443"
      min = "443"
    }
  }
  freeform_tags = local.freeform_tags
}

resource "oci_core_subnet" "public_subnet" {
  cidr_block     = local.cidr_block.public
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  security_list_ids = [
    oci_core_default_security_list.default_security_list.id,
    oci_core_security_list.custom_security_list.id
  ]
  display_name               = format("%s-public-subnet", var.prefix)
  route_table_id             = oci_core_default_route_table.public_route_table.id
  prohibit_public_ip_on_vnic = false
  freeform_tags              = local.freeform_tags
}

resource "oci_core_subnet" "private_subnet" {
  cidr_block     = local.cidr_block.private
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  security_list_ids = [
    oci_core_default_security_list.default_security_list.id,
    oci_core_security_list.custom_security_list.id
  ]
  display_name   = format("%s-private-subnet", var.prefix)
  route_table_id = oci_core_route_table.private_route_table.id
  freeform_tags  = local.freeform_tags
}
