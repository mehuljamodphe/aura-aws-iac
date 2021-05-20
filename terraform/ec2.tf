//resource "aws_instance" "acf-prod-web-srv" {
//  ami = var.instance_ami_id
//
//  instance_type               = var.general_instance_type
//  vpc_security_group_ids      = [aws_security_group.acf_web_sg.id]
//  subnet_id                   = tolist(data.aws_subnet_ids.public.ids)[0]
//  key_name                    = var.ssh_key_pair
////  associate_public_ip_address = true
//
//  tags = merge(local.common_tags,
//    {
//      Name        = "acf-prod-web-srv"
//  })
//
//}
//
//resource "aws_eip" "acf_prod_eip" {
////  name = "eip-prod-acf-web"
//  instance = aws_instance.acf-web-srv.id
//  vpc = true
//
//  tags = merge(local.common_tags,
//    {
//      Name = "eip-acf-web"
//  })
//}
//
//resource "aws_eip_association" "eip_assoc" {
//  instance_id   = aws_instance.acf-web-srv.id
//  allocation_id = aws_eip.acf_prod_eip.id
//}


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