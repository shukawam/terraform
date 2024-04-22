resource "oci_artifacts_container_repository" "get_secret_from_vault" {
  compartment_id = var.compartment_ocid
  display_name   = "shukawam/fn/get-secret-from-vault"
  freeform_tags  = local.freeform_tags
}

resource "oci_artifacts_container_repository" "micronaut-function" {
  compartment_id = var.compartment_ocid
  display_name   = "shukawam/fn/micronaut-function"
  freeform_tags  = local.freeform_tags
}

resource "oci_artifacts_container_repository" "kafka-producer" {
  compartment_id = var.compartment_ocid
  display_name   = "shukawam/kafka-producer"
  freeform_tags  = local.freeform_tags
}

resource "oci_artifacts_container_repository" "kafka-consumer" {
  compartment_id = var.compartment_ocid
  display_name   = "shukawam/kafka-consumer"
  freeform_tags  = local.freeform_tags
}
