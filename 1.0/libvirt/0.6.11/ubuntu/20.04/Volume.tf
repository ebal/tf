resource "libvirt_volume" "tf-focal-base" {
  name   = "${random_id.id.id}_tf-focal-base.qcow2"
  pool   = "default"
  source = "../../images/ubuntu/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "tf-focal-vol" {
  name           = "${random_id.id.id}_tf-focal-vol.qcow2"
  pool           = "default"
  base_volume_id = libvirt_volume.tf-focal-base.id
  size           = var.vol_size
  format         = "qcow2"
}

