terraform {
  required_version = ">= 1.0"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.11"
    }

    http = {
      source = "hashicorp/http"
    }

    random = {
      source = "hashicorp/random"
    }

    template = {
      source = "hashicorp/template"
    }

  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "random_id" "id" {
  byte_length = 8
}

