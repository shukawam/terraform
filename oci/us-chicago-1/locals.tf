##### Networks
locals {
  cidr_block = {
    all     = "0.0.0.0/0"
    vcn     = "192.168.0.0/16"
    public  = "192.168.1.0/24"
    private = "192.168.2.0/24"
  }
  dns_label = {
    vcn     = "vcn"
    public  = "public"
    private = "private"
  }
  source_type = {
    cidr_block = "CIDR_BLOCK"
  }
  destination_type = {
    cidr_block         = "CIDR_BLOCK"
    service_cidr_block = "SERVICE_CIDR_BLOCK"
  }
  protocol = {
    all     = "all"
    icmp    = "1"
    tcp     = "6"
    udp     = "17"
    icmp_v6 = "58"
  }
  ad           = data.oci_identity_availability_domains.ads.availability_domains[0].name
  all_services = data.oci_core_services.all_services.services.0
}

##### Common
locals {
  freeform_tags = {
    "CreatedBy" = "Terraform"
  }
}

##### OCI Functions
locals {
  functions_shape = {
    x86 = "GENERIC_X86"
    arm = "GENERIC_ARM"
  }
}

##### Compute
locals {
  compute = {
    ubuntu     = data.oci_core_images.ubuntu_22_04.images[0].id
    shape      = data.oci_core_shapes.shapes.shapes[0].name
    cloud_init = data.template_cloudinit_config.cloud_init_config[0].rendered
  }
}

##### OpenSearch
locals {
  opensearch = {
    node_type = "FLEX"
    data = {
      node    = 1
      ocpu    = 4
      memory  = 20
      storage = 50
    }
    master = {
      node   = 1
      ocpu   = 1
      memory = 20
    }
    dashboard = {
      node   = 1
      ocpu   = 1
      memory = 16
    }
    security_mode = "ENFORCING"
  }
}

##### Redis
locals {
  redis = {
    node    = 2
    memory  = 8
    version = "V7_0_5"
  }
}
