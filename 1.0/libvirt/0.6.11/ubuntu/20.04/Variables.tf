
variable "domain" {
  description = "The domain/host name of the zone"
  default     = "wackowiki"
}

variable "ssh_port" {
  description = "The sshd port of the VM"
  default     = 22
}

variable "IP_addr" {
  description = "The mac & iP address for this VM"
  default     = 22
}

variable "timezone" {
  description = "/usr/share/zoneinfo/"
  default     = "Europe/Athens"
}

variable "vol_size" {
  description = "The mac & iP address for this VM"
  # 10G
  default = 10 * 1024 * 1024 * 1024
}

data "http" "gitlab_keys" {
  url = "https://gitlab.com/ebal.keys"

  # Optional request headers
  request_headers = {
    Accept = "application/text"
  }
}

