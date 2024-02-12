output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnets" {
  value = aws_subnet.public_subnet[*].id
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "public_ip" {
  value = aws_launch_configuration.Trams4U.associate_public_ip_address
}

//output "elb_dns_name" {
//  value = aws_elb.Trams4U_elb.dns_name
//}



output "instances" {
  value = aws_launch_configuration.Trams4U.id
  
}

