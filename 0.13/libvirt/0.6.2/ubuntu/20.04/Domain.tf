resource "libvirt_domain" "domain-ubuntu" {
  name = "ubuntu-terraform"

  memory = "2048"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  network_interface {
    network_id     = libvirt_network.tf_net.id
    network_name   = "tf_net"
    addresses      = ["192.168.123.${var.IP_addr}"]
    mac            = "52:54:00:b2:2f:${var.IP_addr}"
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
    volume_id = libvirt_volume.ubuntu-2004-base.id
  }

}

