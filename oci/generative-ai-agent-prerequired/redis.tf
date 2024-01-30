resource "oci_redis_redis_cluster" "shukawam_redis_cluster" {
  compartment_id = var.compartment_ocid
  display_name = "shukawam-redis-cluster"
  node_count = 1
  node_memory_in_gbs = 16
  software_version = "V7_0_5"
  subnet_id = oci_core_subnet.shukawam_public_subnet.id
}
