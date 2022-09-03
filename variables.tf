variable "ami" {
}

variable "key_name" {
}

variable "availability_zone_1a"{
}

variable "availability_zone_1b" {
}

variable "instance_type" {
}

variable "region" {
}

variable "instance_tenancy" { 
}

variable "cidr_block_vpc" {
}

variable "cidr_pub_sub" {
}

variable "cidr_pvt_sub" {
}

variable "cidr_block" {
}

variable "ingress_ports_pub_sg" {
    type = list
    default = [22, 80]
}

variable "ingress_ports_pvt_sg" {
    type = list
    default = [22, 3306]
}