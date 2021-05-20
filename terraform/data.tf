data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_subnet_ids" "public" {
  filter {
    name   = "tag:Type"
    values = ["public"]
  }
  vpc_id = module.vpc.vpc_id
}


data "aws_subnet_ids" "all" {
  vpc_id = module.vpc.vpc_id
}