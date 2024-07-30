resource "oci_health_checks_http_monitor" "grafana_monitor" {
  compartment_id      = var.compartment_ocid
  display_name        = "grafana-monitor"
  interval_in_seconds = local.healthcheck.interval_in_seconds
  protocol            = local.healthcheck.protocol
  targets             = ["grafana.shukawam.me"]
}

resource "oci_health_checks_http_monitor" "argocd_monitor" {
  compartment_id      = var.compartment_ocid
  display_name        = "argocd-monitor"
  interval_in_seconds = local.healthcheck.interval_in_seconds
  protocol            = local.healthcheck.protocol
  targets             = ["argocd.shukawam.me"]
}

resource "oci_health_checks_http_monitor" "keycloak_monitor" {
  compartment_id      = var.compartment_ocid
  display_name        = "keycloak-monitor"
  interval_in_seconds = local.healthcheck.interval_in_seconds
  protocol            = local.healthcheck.protocol
  targets             = ["keycloak.shukawam.me"]
}

resource "oci_health_checks_http_monitor" "langfuse_monitor" {
  compartment_id      = var.compartment_ocid
  display_name        = "langfuse-monitor"
  interval_in_seconds = local.healthcheck.interval_in_seconds
  protocol            = local.healthcheck.protocol
  targets             = ["langfuse.shukawam.me"]
}
