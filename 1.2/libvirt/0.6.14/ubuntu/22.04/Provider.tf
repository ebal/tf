terraform {
  required_version = ">= 1.2"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.14"
    }

    template = {
      source  = "hashicorp/template"
    }

  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

