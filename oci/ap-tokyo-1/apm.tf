resource "oci_apm_apm_domain" "apm" {
  compartment_id = var.compartment_ocid
  display_name   = format("%s-apm-domain", var.prefix)
  is_free_tier   = false
  freeform_tags  = local.freeform_tags
}
