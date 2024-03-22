resource "oci_container_instances_container_instance" "shukawam_container_instance" {
  compartment_id = var.compartment_ocid
  availability_domain = local.ad
  shape = "CI.Standard.E4.Flex"
  shape_config {
    ocpus = "1"
    memory_in_gbs = "4"
  }
  containers {
    image_url = "docker.io/nginx:latest"
  }
  vnics {
    subnet_id = "ocid1.subnet.oc1.ap-tokyo-1.aaaaaaaaz6jlc4uhaz7lcbiidptubldl3tuxps6wie4xhswa4rx4stufwpeq"
  }
}
