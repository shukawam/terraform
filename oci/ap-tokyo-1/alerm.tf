resource "oci_monitoring_alarm" "grafana_alert" {
  compartment_id        = var.compartment_ocid
  metric_compartment_id = var.compartment_ocid
  namespace             = "oci_healthchecks"
  display_name          = "grafana-alert"
  destinations          = local.alert.destination_topic
  is_enabled            = true
  query                 = "HTTP.isHealthy[30m]{target = \"grafana.shukawam.me\"}.min() == 0"
  severity              = "CRITICAL"
}

resource "oci_monitoring_alarm" "keycloak_alert" {
  compartment_id        = var.compartment_ocid
  metric_compartment_id = var.compartment_ocid
  namespace             = "oci_healthchecks"
  display_name          = "keycloak-alert"
  destinations          = local.alert.destination_topic
  is_enabled            = true
  query                 = "HTTP.isHealthy[30m]{target = \"keycloak.shukawam.me\"}.min() == 0"
  severity              = "CRITICAL"
}

resource "oci_monitoring_alarm" "argocd_alert" {
  compartment_id        = var.compartment_ocid
  metric_compartment_id = var.compartment_ocid
  namespace             = "oci_healthchecks"
  display_name          = "argocd-alert"
  destinations          = local.alert.destination_topic
  is_enabled            = true
  query                 = "HTTP.isHealthy[30m]{target = \"argocd.shukawam.me\"}.min() == 0"
  severity              = "CRITICAL"
}

resource "oci_monitoring_alarm" "langfuse_alert" {
  compartment_id        = var.compartment_ocid
  metric_compartment_id = var.compartment_ocid
  namespace             = "oci_healthchecks"
  display_name          = "langfuse-alert"
  destinations          = local.alert.destination_topic
  is_enabled            = true
  query                 = "HTTP.isHealthy[30m]{target = \"langfuse.shukawam.me\"}.min() == 0"
  severity              = "CRITICAL"
}
