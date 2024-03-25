resource "oci_functions_application" "application" {
  compartment_id = var.compartment_ocid
  display_name   = format("%s-application", var.prefix)
  shape          = local.functions_shape.x86
  subnet_ids = [
    oci_core_subnet.public_subnet.id,
    oci_core_subnet.private_subnet.id
  ]
  trace_config {
    domain_id  = oci_apm_apm_domain.apm.compartment_id
    is_enabled = true
  }
  freeform_tags = local.freeform_tags
}
