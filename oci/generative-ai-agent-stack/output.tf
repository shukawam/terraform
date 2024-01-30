output "bastion_public_ip" {
  value = oci_core_instance.shukawam_instance.public_ip
}

output "opensearch_api_ip" {
  value = oci_opensearch_opensearch_cluster.shukawam_opensearch_cluster.opensearch_private_ip
}

output "opensearch_dashboard_ip" {
  value = oci_opensearch_opensearch_cluster.shukawam_opensearch_cluster.opendashboard_private_ip
}
