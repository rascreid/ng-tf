#######################
#       TFVARS        #
#######################

variable "do_token" {}
variable "access_key" {}
variable "secret_key" {}

variable "email" {}
variable "dns_zone" {}
variable "pub_key" {}

#######################

variable "web_count" {
    type = number
    description = "Number of web servers to create"
    default = 1
}

variable "lb_count" {
    type = number
    description = "Number of LB to create"
    default = 1
}

# variable "pub_key" {
#     type = string
#     description = "My pub key"
#     default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCxAw+QMyLPwrmEhDnl4QjpibEEo2digPBfjhbGn5lNga5jrxZVV+D0NktVeplG/CBP7F1NIa7x/zl0AaPWKIOO49NW7FKlkKOgSaCcJeRLhLnZo/s80xgLmsk35ILLIHZ/k59GlwYUXte1mIiyXu5fM82IXM+n5xeGrTNFBAXhL4jJnD5MjoQqcSnhskTkhODYILn/0g04RgbcEDmb7xn+KdMRMzVksPwUIm7NTeOCOE+cOdF/1odxF3tYOyJCZnvynElgEbK1bfC4F70k/LkM3P/cyG+GEQNTVlQbz27tF26HZ+TeWqYUEZi5TNnTkmIHTgaA+JUYzrEo9h9g8bqOxALbvD09yLNa98yc7nSDtmQj34CaAQH+dpoeXgvx7mvyfAjgBohGTunC3haN58XtbZ7SnwfXh0wfVwi8A5E8aA08lRy03rtDjH6n0keMcxbl9M82gCYflx+eruTouwtxTdQ9ZMIZVhIkdreu+o0TO/2LQekOUi3hwxwnEjHC7uf03kiS57qCwP8lhGyZziOUAeZcOnJoIPI39ol/Zse80vYaPRyFMKDK6TcX2nMxcmOOxoUXXU2Qk1Jrgw9+0XQjUmLwK/7k2FQ+xnE3pA060xN//BvOi2N/MPd77m252nebMJhOBF4qSA43rL/Tp80PD7SBm2HG7/kZ8qpgXTQYlQ== alexandrmartseniuk@gmail.com"
# }

# variable "dns_zone" {
#     type = string
#     description = "RE DNS Zone"
#     default = "devops.rebrain.srwx.net."
# }