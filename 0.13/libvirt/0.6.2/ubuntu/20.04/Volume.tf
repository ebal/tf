resource "libvirt_volume" "ubuntu-2004-vol" {
  name = "ubuntu-2004-vol"
  pool = "default"
  #source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  source = "../ubuntu-20.04.img"
  format = "qcow2"
}

resource "libvirt_volume" "ubuntu-2004-base" {
  name           = "ubuntu-2004-base"
  pool           = "default"
  base_volume_id = libvirt_volume.ubuntu-2004-vol.id
  size           = var.vol_size
}

