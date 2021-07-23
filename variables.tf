#######################
#       TFVARS        #
#######################

variable "do_token" {
     type = string
     description = "Token for Digital Ocean"
}

variable "access_key" {
    type = string
    description = "AWS Credentials"
}

variable "secret_key" {
    type = string
    description = "AWS Credentials"
}

variable "email" {
    type = string
    description = "Used In TAGs"
}

variable "dns_zone" {
    type = string
    description = "Zone in aws_route53"
}

variable "pub_key" {
    type = string
    description = "Public key for accessing VMs"
}

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