import {
  id = "ocid1.onstopic.oc1.ap-tokyo-1.aaaaaaaa6gdechfbz57ll27yqybr7gt2gylm6ijfzfuxwhh4xza2ocklvb5a"
  to = "topic"
}

resource "oci_ons_notification_topic" "topic" {
  compartment_id = var.compartment_ocid
  name = "shukawam-topics"
}

import {
  id = "ocid1.onssubscription.oc1.ap-tokyo-1.aaaaaaaai3ts5luy2jdwblqxe3wl6pc447iy3ivmoq2odmyoqopwe7ohslhq"
  to = "slack_subscription"
}

resource "oci_ons_subscription" "slack_subscription" {
  compartment_id = var.compartment_ocid
  protocol = "slack"
  endpoint = var.slack_endpoint
  topic_id = oci_ons_notification_topic.topic.id
}
