resource "aws_instance" "acf-prod-web-srv" {
  ami = var.instance_ami_id

  instance_type               = var.general_instance_type
  vpc_security_group_ids      = [aws_security_group.acf_web_sg.id]
  subnet_id                   = tolist(data.aws_subnet_ids.public.ids)[0]
  key_name                    = var.ssh_key_pair
//  associate_public_ip_address = true

  tags = merge(local.common_tags,
    {
      Name        = "acf-prod-web-srv"
  })

}

resource "aws_eip" "acf_prod_eip" {
//  name = "eip-prod-acf-web"
  instance = aws_instance.acf-prod-web-srv.id
  vpc = true

  tags = merge(local.common_tags,
    {
      Name = "eip-acf-web"
  })
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.acf-prod-web-srv.id
  allocation_id = aws_eip.acf_prod_eip.id
}

//
//resource "aws_instance" "acf-stg-web-srv" {
//  ami = var.instance_ami_id
//
//  instance_type               = var.general_instance_type
//  vpc_security_group_ids      = [aws_security_group.acf_web_sg.id]
//  subnet_id                   = tolist(data.aws_subnet_ids.public.ids)[0]
//  key_name                    = var.ssh_key_pair
//  associate_public_ip_address = true
//
//  tags = merge(local.common_tags,
//    {
//      Name        = "acf-stg-web-srv"
//  })
//
//}

//module "acf-stg-web-srv" {
//  source                        = "git::https://github.com/cloudposse/terraform-aws-ec2-instance.git?ref=tags/0.32.2"
//  namespace                     = var.project
//  stage                         = var.environment
//  name                          = "acf-stg"
//  ami                           = var.instance_ami_id
//  ami_owner                     = data.aws_caller_identity.current.id
//  instance_type                 = var.general_instance_type
//  ssh_key_pair                  = var.ssh_key_pair
//  vpc_id                        = module.vpc.vpc_id
//  associate_public_ip_address   = true
//  assign_eip_address            = true
//  metadata_http_tokens_required = false
//  create_default_security_group = false
//  root_block_device_encrypted   = false
//  ebs_optimized                 = false
//  root_volume_size              = 10
//  monitoring                    = false
//
//  security_groups = [
//    aws_security_group.acf_web_sg.id
//  ]
//  subnet          = tolist(data.aws_subnet_ids.public.ids)[0]
//
//  tags = merge(local.common_tags,
//    {
//     Name        = "acf-stg"
//  })
//
//}