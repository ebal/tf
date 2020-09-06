
variable "domain" {
  description = "The domain/host name of the zone"
  default     = "terraforming_2004"
}

variable "ssh_port" {
  description = "The sshd port of the VM"
  default     = 12345
}

variable "IP_addr" {
  description = "The mac & iP address for this VM"
  default     = 51
}

variable "vol_size" {
  description = "The mac & iP address for this VM"
  # 10G
  default = 10 * 1024 * 1024 * 1024
}
