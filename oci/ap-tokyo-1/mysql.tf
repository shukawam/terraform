resource "oci_mysql_mysql_db_system" "mysql" {
  compartment_id      = var.compartment_ocid
  display_name        = "shukawam-mysql"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  availability_domain = local.ad
  shape_name          = "MySQL.32"
  subnet_id           = oci_core_subnet.public_subnet.id
  mysql_version       = "9.0.0"
}

resource "oci_mysql_heat_wave_cluster" "heatwave" {
  db_system_id         = oci_mysql_mysql_db_system.mysql.id
  shape_name           = "HeatWave.512GB"
  cluster_size         = 1
  is_lakehouse_enabled = true
}
