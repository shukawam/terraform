resource "oci_functions_application" "application" {
  compartment_id = var.compartment_ocid
  display_name   = format("%s-application", var.prefix)
  shape          = local.functions_shape.x86
  subnet_ids = [
    oci_core_subnet.public_subnet.id,
    oci_core_subnet.private_subnet.id
  ]
  trace_config {
    domain_id  = oci_apm_apm_domain.apm.id
    is_enabled = true
  }
  freeform_tags = local.freeform_tags
}

resource "oci_functions_function" "get_secret_content_from_vault" {
  application_id = oci_functions_application.application.id
  display_name   = "get-secret-from-vault"
  image          = "nrt.ocir.io/orasejapan/shukawam/fn/get-secret-from-vault:0.0.1"
  memory_in_mbs  = 128
  trace_config {
    is_enabled = true
  }
}
