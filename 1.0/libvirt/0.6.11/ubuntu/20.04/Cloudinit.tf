data "template_file" "user_data" {
  template = file("user-data.yml")
  vars = {
    hostname = var.domain
    sshdport = var.ssh_port
    ipadddr  = var.IP_addr
    timezone = var.timezone
    sshkeys  = data.http.gitlab_keys.body
  }
}

resource "libvirt_cloudinit_disk" "cloud-init" {
  name      = "${random_id.id.id}_cloud-init.iso"
  user_data = data.template_file.user_data.rendered
}

