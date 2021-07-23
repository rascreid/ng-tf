#######################
#         TAGS        #
#######################
resource "digitalocean_tag" "module" {
  name = "devops"
}

resource "digitalocean_tag" "email" {
  name  = var.email
}

resource "digitalocean_ssh_key" "LexKey" {
    name   = "LexKey"
    public_key = var.pub_key
}

#######################
#         VPS         #
#######################
resource "digitalocean_droplet" "web" {
    count    = var.web_count
    image    = "ubuntu-20-04-x64"
    name     = "web-${count.index+1}"
    region   = "nyc1"
    size     = "s-1vcpu-1gb"
    ssh_keys = [digitalocean_ssh_key.LexKey.fingerprint]
    tags     = [digitalocean_tag.module.id,digitalocean_tag.email.id]
}

resource "digitalocean_droplet" "lb" {
    count    = var.lb_count
    image    = "ubuntu-20-04-x64"
    name     = "lb-${count.index+1}"
    region   = "nyc1"
    size     = "s-1vcpu-1gb"
    ssh_keys = [digitalocean_ssh_key.LexKey.fingerprint]
    tags     = [digitalocean_tag.module.id,digitalocean_tag.email.id]
}

#######################
#         DNS         #
#######################
data "aws_route53_zone" "dzone" {
  name = var.dns_zone
}

resource "aws_route53_record" "LB_DNS_RECORDS" {
  count   = var.lb_count
  zone_id = data.aws_route53_zone.dzone.zone_id
  name    = "lex-lb-${count.index+1}.${data.aws_route53_zone.dzone.name}"
  type    = "A"
  ttl     = "300"
  records = [digitalocean_droplet.lb[count.index].ipv4_address]
}

# OPTIONAL FIX WHEN POSSIBLE
#  resource "aws_route53_record" "LB_APP_A_RECORD" {
#    count   = var.lb_count
#    zone_id = data.aws_route53_zone.dzone.zone_id
#    name    = "lex-app.${data.aws_route53_zone.dzone.name}"
#    type    = "A"
#    ttl     = "30"
#    set_identifier = "app"
#    multivalue_answer_routing_policy = true
#    records = [digitalocean_droplet.lb[count.index].ipv4_address]
# }

resource "aws_route53_record" "WEB_DNS_RECORDS" {
  count   = var.web_count
  zone_id = data.aws_route53_zone.dzone.zone_id
  name    = "lex-web-${count.index+1}.${data.aws_route53_zone.dzone.name}"
  type    = "A"
  ttl     = "300"
  records = [digitalocean_droplet.web[count.index].ipv4_address]
}

#######################
#      CONFIGURE      #
#######################

 resource "null_resource" "Ansible" {
   depends_on = [
     local_file.AnsibleInventory
   ]
   provisioner "local-exec" {
     command = "sleep 45 && ansible-playbook ans/ng-role-playbook.yaml -i ans/inventory -u root"
   }
 }