# Deploy ubuntu 20.04 LTS to libvirt/qemu via terraform

test repo to deploy an ubuntu 20.04 LTS virtual machine to libvirt/qemu via terraform.

## Variables

You need to edit **Variables.tf**

- timezone
- ssh port
- github user

## VM Specs

You may need/want to change cpu/mem of this virtual machine.
Edit **Domain.tf**

```bash
  memory = "4096"
  vcpu   = 4

```

## start

before you start:

```bash
terraform init
```

and then:

```bash
./start.sh


Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

ips = tolist([
  "192.168.122.236",
])


$ ssh 192.168.122.236 -l ubuntu 'grep ^VERSION= /etc/os-release'
VERSION="20.04.2 LTS (Focal Fossa)"

```

## destroy

```bash
./destroy.sh
```

## root password

if needed

```bash
$ sudo virsh console tf_ubuntu2004

userame: root
password: ping

````
