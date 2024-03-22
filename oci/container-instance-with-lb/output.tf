output "ci" {
  value = oci_container_instances_container_instance.shukawam_container_instance.vnics.0.private_ip
}
