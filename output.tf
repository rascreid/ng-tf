output "web_ip" {
    value =  flatten(aws_route53_record.WEB_DNS_RECORDS.*.records)
}
output "web_dns" {
    value =  aws_route53_record.WEB_DNS_RECORDS.*.name
}

output "lb_ip" {
    value =  flatten(aws_route53_record.LB_DNS_RECORDS.*.records)
}
output "lb_dns" {
    value =  aws_route53_record.LB_DNS_RECORDS.*.name
}

############ Ansible inventory file ############

  resource "local_file" "AnsibleInventory" {
   content = templatefile("inventory.tmpl",
   {
    web_ip    =  flatten(aws_route53_record.WEB_DNS_RECORDS.*.records),
    web_dns   =  aws_route53_record.WEB_DNS_RECORDS.*.name,
    lb_ip     =  flatten(aws_route53_record.LB_DNS_RECORDS.*.records),
    lb_dns    =  aws_route53_record.LB_DNS_RECORDS.*.name
   }
   )
   filename = "ans/inventory"
  }
