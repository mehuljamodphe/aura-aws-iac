locals {
  public_cidr_block = cidrsubnet(module.vpc.vpc_cidr_block, 1, 0)
  private_cidr_block = cidrsubnet(module.vpc.vpc_cidr_block, 1, 1)
}

module "vpc" {
  source = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.21.0"
  namespace = var.project
  stage = var.environment
  name = "vpc"
  cidr_block = var.VPC_CIDR
//  tags = {
//    Creator = var.Creator
//    Environment = var.environment
//    Application = var.application
//  }
  tags = local.common_tags
}

module "public_subnets" {
  source = "git::https://github.com/cloudposse/terraform-aws-multi-az-subnets.git?ref=tags/0.13.0"
  namespace = var.project
  stage = var.environment
  name = "frontend"
  availability_zones = [
    var.az_1,
    var.az_2]
  vpc_id = module.vpc.vpc_id
  cidr_block = local.public_cidr_block
  type = "public"
  igw_id = module.vpc.igw_id
  nat_gateway_enabled = "false"

  tags = local.common_tags
//  tags = {
//    Creator = var.Creator
//    Environment = var.environment
//    Application = var.application
//    SubnetType = "public"
//  }
}