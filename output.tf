output "web_ip" {
    value = digitalocean_droplet.web.*.ipv4_address
}

output "proxy_ip" {
    value = digitalocean_droplet.proxy.*.ipv4_address
}

### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
 content = templatefile("inventory.tmpl",
 {
  web_ip   = digitalocean_droplet.web.*.ipv4_address,
  proxy_ip = digitalocean_droplet.proxy.*.ipv4_address
 }
 )
 filename = "ans/inventory"
}