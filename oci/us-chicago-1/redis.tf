resource "oci_redis_redis_cluster" "redis_cluster" {
  compartment_id     = var.compartment_ocid
  display_name       = format("%s-redis-cluster", var.prefix)
  node_count         = local.redis.node
  node_memory_in_gbs = local.redis.memory
  software_version   = local.redis.version
  subnet_id          = oci_core_subnet.private_subnet.id
  freeform_tags      = local.freeform_tags
}
