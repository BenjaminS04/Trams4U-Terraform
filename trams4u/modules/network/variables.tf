variable "naming_prefix" {
  type = string
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_public_subnet_count" {
  type        = number
  description = "Number of public subnets to create."
  default     = 2
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "ec2_sg" {
  type        = set(string)
  description = "Security group settings for EC2 instances"
}

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
}



variable "instances" {
  description = "set of instances"
  type        = set(string)
}
  

variable "ami_id" {
  type = string
  default = "ami-0c7217cdde317cfec"
  description = "image setting for ec2 instances"
}

variable "ec2_type" {
  type = string
  default = "t2.micro"
  description = "type of ec2 for ec2 instance"
}