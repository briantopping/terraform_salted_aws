# Borrowed from
# https://github.com/hashicorp/terraform/tree/master/examples/aws-two-tier


# Specify the provider and access details
provider "xenserver" {
  url      = "${var.xen_url}"
  username = "${var.xen_username}"
  password = "${var.xen_password}"
}

resource "xenserver_vm" "salt" {
//  tags = {
//    Name = "${var.site_name}-salt1"
//  }

  base_template_name = "CentOS Minimal"
  name_label = "${var.site_name}-salt1"
  static_mem_min = 8589934592
  static_mem_max = 8589934592
  dynamic_mem_min = 8589934592
  dynamic_mem_max = 8589934592
  vcpus = 1
  boot_order = "c"

  hard_drive {
    is_from_template = true
    user_device = "0"
  } # Template VM HDD
  network_interface {
    network_uuid = "33aee4d7-4714-0899-ee65-b50b33e8212d"
    device = 0
    mtu = 1500
    mac = ""
    other_config {
      ethtool-gso = "off"
      ethtool-ufo = "off"
      ethtool-tso = "off"
      ethtool-sg = "off"
      ethtool-tx = "off"
      ethtool-rx = "off"
    }
  }

//  # Create working directory for provisioning
//  provisioner "remote-exec" {
//    inline = [
//      "mkdir /tmp/terraform"
//    ]
//  }
//
//  # Create an archive of the salt code to boostrap the machine with salt-call
//  provisioner "local-exec" {
//    command = "tar -c formulas pillar salt salt-call Saltfile|gzip > thin.tgz"
//  }
//
//  # Copy the archive to the remote machine
//  provisioner "file" {
//    source = "thin.tgz"
//    destination = "/tmp/terraform/thin.tgz"
//  }
//
//  # Copy the salt-bootstrap provision script to the remote machine
//  provisioner "file" {
//    source = "terraform.provision.bootstrap-salt.sh"
//    destination = "/tmp/terraform/bootstrap-salt.sh"
//  }
//
//  # Copy the salt-call provision script to the remote machine
//  provisioner "file" {
//    source = "terraform.provision.salt-call.sh"
//    destination = "/tmp/terraform/salt-call.sh"
//  }
//
//  # We run a remote provisioner on the instance after creating it.
//  provisioner "remote-exec" {
//    inline = [
//      "sudo sh /tmp/terraform/bootstrap-salt.sh -M -X -Z stable",
//      "sudo sh /tmp/terraform/salt-call.sh \"${var.site_name}-salt1\""
//    ]
//  }
}

data "xenserver_vm_networks" "saltmaster_interfaces" {
  vm_uuid = "${xenserver_vm.salt.id}"
  startup_delay = 20 # wait for VM to boot for 10 seconds
}
