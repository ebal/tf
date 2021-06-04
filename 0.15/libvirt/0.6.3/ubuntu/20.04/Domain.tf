resource "libvirt_domain" "domain-ubuntu" {
  name = "tf_${var.domain}"

  memory = "2048"
  vcpu   = 2

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  network_interface {
    network_name   = "default"
    wait_for_lease = true
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
    volume_id = libvirt_volume.ubuntu-base.id
  }

}

