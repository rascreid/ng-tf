output "web_ip" {
    value = digitalocean_droplet.web.*.ipv4_address
}

output "lb_ip" {
    value = digitalocean_droplet.lb.*.ipv4_address
}

############ Ansible inventory file ############

resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  web_ip   = digitalocean_droplet.web.*.ipv4_address,
  lb_ip    = digitalocean_droplet.lb.*.ipv4_address
 }
 )
 filename = "ans/inventory"
}