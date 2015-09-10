### MANDATORY ###
variable "hosted_zone_name" {}
variable "public_hosted_zone_id" {}
variable "public_hosted_zone_name" {}

# group our resources
variable "stream_tag" {
  default = "default"
}

###################################################################
# AWS configuration below
###################################################################
variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
  default = "consul"
}

### MANDATORY ###
variable "key_path" {
  description = "Path to the private portion of the SSH key specified."
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default = "ap-southeast-2"
}

variable "security_group_name" {
  description = "Name of security group to use in AWS."
  default = "consul server"
}

###################################################################
# VPC configuration below
###################################################################

### MANDATORY ###
variable "vpc_id" {
  description = "vpc id for the consul cluster"
}

### MANDATORY ###
variable "subnet_a" {
  description = "Subnet A for consul"
}

### MANDATORY ###
variable "subnet_b" {
  description = "Subnet B for consul"
}

# the ability to add additional existing security groups.
variable "additional_security_groups" {
  default = ""
}

###################################################################
# ELB / Route53 Configuration
###################################################################

variable "elb_allowed_cidr_blocks"{
  default = "0.0.0.0/0"
}

### MANDATORY ###
variable "ssl_certificate_arn" {
  description = "Required for ELB https"
}

variable "private_hosted_zone_name" {
  description = "private zone"
  default = "consul.internal"
}

### MANDATORY ###
variable "public_hosted_zone_name" {
  description = "public zone name"
}

### MANDATORY ###
variable "public_hosted_zone_id" {
  description = "public zone id"
}

###################################################################
# Consul configuration below
###################################################################

variable "aws_consul_amis" {
  default = {
    ap-southeast-2 = "ami-8997ecb3"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

# number of nodes in zone a
variable "subnet_a_num_nodes" {
  description = "Consul server nodes in a"
  default = "2"
}

# number of nodes in zone b
variable "subnet_b_num_nodes" {
  description = "Consul server nodes in b"
  default = "1"
}
