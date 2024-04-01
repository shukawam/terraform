resource "oci_artifacts_container_repository" "get_secret_from_vault" {
  compartment_id = var.compartment_ocid
  display_name   = "shukawam/fn/get-secret-from-vault"
}
