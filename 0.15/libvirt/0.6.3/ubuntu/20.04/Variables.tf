# Variables

variable "domain" {
  description = "The domain/host name of the zone"
  default     = "ubuntu2004"
}

variable "cloud_image" {
  description = "The image source of the VM"
  default     = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  #default     = "focal-server-cloudimg-amd64.img"
}

variable "timezone" {
  description = "/usr/share/zoneinfo/"
  default     = "Europe/Athens"
}

variable "ssh_port" {
  description = "The sshd port of the VM"
  default     = 22
}

variable "gh_user" {
  description = "The default ssh key for this VM"
  # https://github.com/<username>.keys
  default     = "ebal"
}

variable "vol_size" {
  description = "The mac & iP address for this VM"
  # 10G
  default = 10 * 1024 * 1024 * 1024
}
