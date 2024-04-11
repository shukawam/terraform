resource "oci_opensearch_opensearch_cluster" "opensearch_cluster" {
  compartment_id        = var.compartment_ocid
  display_name          = format("%s-opensearch-cluster", var.prefix)
  vcn_id                = oci_core_vcn.vcn.id
  vcn_compartment_id    = var.compartment_ocid
  subnet_id             = oci_core_subnet.private_subnet.id
  subnet_compartment_id = var.compartment_ocid
  software_version      = var.opensearch_version
  # Data Nodes
  data_node_count           = local.opensearch.data.node
  data_node_host_ocpu_count = local.opensearch.data.ocpu
  data_node_host_memory_gb  = local.opensearch.data.memory
  data_node_storage_gb      = local.opensearch.data.storage
  data_node_host_type       = local.opensearch.node_type
  # Master Nodes
  master_node_count           = local.opensearch.master.node
  master_node_host_ocpu_count = local.opensearch.master.ocpu
  master_node_host_memory_gb  = local.opensearch.master.memory
  master_node_host_type       = local.opensearch.node_type
  # Dashboard Nodes
  opendashboard_node_count           = local.opensearch.dashboard.node
  opendashboard_node_host_ocpu_count = local.opensearch.dashboard.ocpu
  opendashboard_node_host_memory_gb  = local.opensearch.dashboard.memory
  security_mode                      = local.opensearch.security_mode
  security_master_user_name          = var.opensearch_master_username
  security_master_user_password_hash = var.opensearch_master_user_password_hash
  freeform_tags                      = local.freeform_tags
}
