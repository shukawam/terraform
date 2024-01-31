locals {
  dsn_label                 = "shukawam"
  cidr_block                = "192.168.0.0/16"
  cidr_block_public_subnet  = "192.168.0.0/24"
  cidr_block_private_subnet = "192.168.1.0/24"
  cidr_block_all            = "0.0.0.0/0"
  all_services              = data.oci_core_services.all_services.services.0
  destination_type_cidr     = "CIDR_BLOCK"
  destination_type_service  = "SERVICE_CIDR_BLOCK"
  protocol_all              = "all"
  protocol_icmp             = "1"
  protocol_tcp              = "6"
  opensearch_node_type      = "FLEX"
}
