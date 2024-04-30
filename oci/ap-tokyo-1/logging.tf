resource "oci_logging_log_group" "log_group" {
  compartment_id = var.compartment_ocid
  display_name = format("%s-log-group", var.prefix)
  freeform_tags = local.freeform_tags
}

resource "oci_logging_log" "micronaut_logs" {
  display_name = format("%s-micronaut-logs", var.prefix)
  log_group_id = oci_logging_log_group.log_group.id
  log_type = "CUSTOM"
}
