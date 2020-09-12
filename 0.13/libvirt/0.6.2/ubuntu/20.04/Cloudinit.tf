data "template_file" "user_data" {
  template = file("user-data.yml")
  vars = {
    hostname = var.domain
    sshdport = var.ssh_port
  }
}

resource "libvirt_cloudinit_disk" "cloud-init" {
  name           = "cloud-init.iso"
  user_data      = data.template_file.user_data.rendered
}

