variable "subnet_pub_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnet_pvt_cidr" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "ami" {
  default = "ami-090fa75af13c156b4"
}

variable "instance_type" {
  default = "t2-micro"
}
