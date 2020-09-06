resource "libvirt_network" "tf_net" {
  name      = "tf_net"
  domain    = "libvirt.local"
  addresses = ["192.168.123.0/24"]
  dhcp {
    enabled = true
  }
  dns {
    enabled = true
  }
}
