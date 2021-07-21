variable "web_count" {
  default = 1
}

variable "proxy_count" {
  default = 1
}

resource "digitalocean_ssh_key" "LexKey" {
  name   = "LexKey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxAw+QMyLPwrmEhDnl4QjpibEEo2digPBfjhbGn5lNga5jrxZVV+D0NktVeplG/CBP7F1NIa7x/zl0AaPWKIOO49NW7FKlkKOgSaCcJeRLhLnZo/s80xgLmsk35ILLIHZ/k59GlwYUXte1mIiyXu5fM82IXM+n5xeGrTNFBAXhL4jJnD5MjoQqcSnhskTkhODYILn/0g04RgbcEDmb7xn+KdMRMzVksPwUIm7NTeOCOE+cOdF/1odxF3tYOyJCZnvynElgEbK1bfC4F70k/LkM3P/cyG+GEQNTVlQbz27tF26HZ+TeWqYUEZi5TNnTkmIHTgaA+JUYzrEo9h9g8bqOxALbvD09yLNa98yc7nSDtmQj34CaAQH+dpoeXgvx7mvyfAjgBohGTunC3haN58XtbZ7SnwfXh0wfVwi8A5E8aA08lRy03rtDjH6n0keMcxbl9M82gCYflx+eruTouwtxTdQ9ZMIZVhIkdreu+o0TO/2LQekOUi3hwxwnEjHC7uf03kiS57qCwP8lhGyZziOUAeZcOnJoIPI39ol/Zse80vYaPRyFMKDK6TcX2nMxcmOOxoUXXU2Qk1Jrgw9+0XQjUmLwK/7k2FQ+xnE3pA060xN//BvOi2N/MPd77m252nebMJhOBF4qSA43rL/Tp80PD7SBm2HG7/kZ8qpgXTQYlQ== alexandrmartseniuk@gmail.com"
}

#######################
#         TAGS        #
#######################
resource "digitalocean_tag" "module" {
  name = "devops"
}

resource "digitalocean_tag" "email" {
  name  = "alexandrmartseniuk_at_gmail_com"
}

#######################
#         VPS         #
#######################
resource "digitalocean_droplet" "web" {
    count    = var.web_count
    image    = "ubuntu-18-04-x64"
    name     = "web-${count.index+1}"
    region   = "nyc1"
    size     = "s-1vcpu-1gb"
    ssh_keys = [digitalocean_ssh_key.LexKey.fingerprint]
    tags     = [digitalocean_tag.module.id,digitalocean_tag.email.id]
}

resource "digitalocean_droplet" "proxy" {
    count    = var.proxy_count
    image    = "ubuntu-18-04-x64"
    name     = "proxy-${count.index+1}"
    region   = "nyc1"
    size     = "s-1vcpu-1gb"
    ssh_keys = [digitalocean_ssh_key.LexKey.fingerprint]
    tags     = [digitalocean_tag.module.id,digitalocean_tag.email.id]
}
