output "ips" {
  value = libvirt_domain.domain-focal.network_interface.0.addresses
}
