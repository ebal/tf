# Deploy ubuntu 22.04 LTS to libvirt/qemu via terraform

test repo to deploy an ubuntu 22.04 LTS virtual machine to libvirt/qemu via terraform.

## Variables

You need to edit **Variables.tf**

- timezone
- ssh port
- github user

## start

```bash
./start.sh


Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

ips = tolist([
  "192.168.122.236",
])


$ ssh 192.168.122.236 -l ubuntu 'grep ^VERSION= /etc/os-release'
VERSION="22.04.1 LTS (Jammy Jellyfish)"

```

## destroy

```bash
./destroy.sh

```

## root password

if needed

```bash
$ sudo virsh console tf_ubuntu2204

userame: root
password: ping

````
