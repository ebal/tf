resource "libvirt_domain" "domain-focal" {
  name = var.domain

  memory = "4096"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  network_interface {
    network_name   = "default"
    mac            = "52:54:00:ce:1c:${var.IP_addr}"
    addresses      = ["192.168.122.${var.IP_addr}"]
    hostname       = var.domain
    wait_for_lease = false
  }

  console {
    target_type = "serial"
    type        = "pty"
    target_port = "0"
  }
  console {
    target_type = "virtio"
    type        = "pty"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.tf-focal-vol.id
  }

}

