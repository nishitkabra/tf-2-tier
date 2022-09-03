terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "demo_vpc" {
  cidr_block       = var.cidr_block_vpc
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "demo_vpc"
  }
}
