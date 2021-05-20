variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" { }
variable "VPC_CIDR" {}

variable "project" {
  default = "acf"
}

variable "environment" {
  default = "prod"
}

variable "application" {
  default = "aura"
}

variable "az_1" {
  default = "eu-west-2a"
}
variable "az_2" {
  default = "eu-west-2b"
}
variable "az_3" {
  default = "eu-west-2c"
}

variable "Creator" {
  default = "Terraform"
}

variable "ssh_key_pair" {
  default = "aura-app-key"
}

variable "ssh_key_pair_path_public" {
  default = "../keys/aura-app-key.pem"
}

variable "instance_ami_id" {
  default = "ami-0194c3e07668a7e36" //Ubuntu Server 20.04 LTS (HVM)
}

variable "general_instance_type" {
  default = "t3.nano" //ubuntu
}