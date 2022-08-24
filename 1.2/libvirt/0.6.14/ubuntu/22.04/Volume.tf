resource "libvirt_volume" "ubuntu-vol" {
  name = "ubuntu-vol"
  pool = "default"
  source = var.cloud_image
  format = "qcow2"
}

resource "libvirt_volume" "ubuntu-base" {
  name           = "ubuntu-base"
  pool           = "default"
  base_volume_id = libvirt_volume.ubuntu-vol.id
  size           = var.vol_size
}
