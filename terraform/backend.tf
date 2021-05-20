terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "eu-west-2"
    bucket         = "acf-prod-eu-west-2-terraform-state"
    key            = "terraform.tfstate"
    dynamodb_table = "acf-prod-eu-west-2-terraform-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
