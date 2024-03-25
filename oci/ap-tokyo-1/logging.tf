resource "oci_logging_log_group" "log_group" {
  compartment_id = var.compartment_ocid
  display_name = format("%s-log-group", var.prefix)
  freeform_tags = local.freeform_tags
}
