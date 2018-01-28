output "saltmaster_address" {
//  value = ["${xenserver_vm.salt.*.public_ip}"]
  value = ["${data.xenserver_vm_networks.saltmaster_interfaces.ip}"]
}
