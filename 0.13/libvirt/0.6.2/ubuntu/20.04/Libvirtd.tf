provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "ubuntu-2004-vol" {
  name = "ubuntu-2004-vol"
  pool = "default"
  #source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img"
  source = "ubuntu-20.04.img"
  format = "qcow2"
}

resource "libvirt_volume" "ubuntu-2004-base" {
  name           = "ubuntu-2004-base"
  pool           = "default"
  base_volume_id = libvirt_volume.ubuntu-2004-vol.id
  size           = var.vol_size
}

data "template_file" "user_data" {
  template = "${file("user-data.yml")}"
  vars = {
    hostname = var.domain
    sshdport = var.ssh_port
  }
}

data "template_file" "network_config" {
  template = file("netplan.yml")
}

resource "libvirt_cloudinit_disk" "cloud-init" {
  name           = "cloud-init.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
}

resource "libvirt_domain" "domain-ubuntu" {
  name   = "ubuntu-terraform"
  memory = "2048"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.cloud-init.id

  network_interface {
    network_name   = "default"
    addresses      = ["192.168.122.${var.IP_addr}"]
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

output "ips" {
  value = libvirt_domain.domain-ubuntu.network_interface.0.addresses
}

