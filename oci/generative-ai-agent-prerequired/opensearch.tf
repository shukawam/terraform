resource "oci_opensearch_opensearch_cluster" "shukawam_opensearch_cluster" {
  compartment_id = var.compartment_ocid
  display_name = "shukawam-opensearch-cluster"
  vcn_id = oci_core_vcn.shukawam_vcn.id
  vcn_compartment_id = var.compartment_ocid
  subnet_id = oci_core_subnet.shukawam_public_subnet.id
  subnet_compartment_id = var.compartment_ocid
  software_version = "2.3.0" # TODO: Bump up version 2.3.0 to 2.8.0
  # Data Nodes
  data_node_count = 1
  data_node_host_ocpu_count = 4
  data_node_host_memory_gb = 20
  data_node_storage_gb = 50
  data_node_host_type = local.opensearch_node_type
  # Master Nodes
  master_node_count = 1
  master_node_host_ocpu_count = 1
  master_node_host_memory_gb = 20
  master_node_host_type = local.opensearch_node_type
  # Dashboard Nodes
  opendashboard_node_count = 1
  opendashboard_node_host_ocpu_count = 1
  opendashboard_node_host_memory_gb = 16
  security_mode = "ENFORCING"
  security_master_user_name = var.opensearch_master_username
  security_master_user_password_hash = var.opensearch_master_user_password_hash
}
