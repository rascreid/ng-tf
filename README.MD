## How-to

*This "pet-project" still in refactoring/improvement stage*

With filled TFVARS run:

```
terraform init
terraform apply
```

Will be created:
- 2 Ubuntu VMs in DO
- Ansible inventory file will be auto generated from aws_route53 resource
- VMs will be provisioned with Nginx 1-LB, 1-WebServer with simple static site

## TFVARS Content

```
do_token = ""

access_key = ""
secret_key = ""

email    = ""
dns_zone = "smt.net."
pub_key  = "ssh-rsa ...."
```