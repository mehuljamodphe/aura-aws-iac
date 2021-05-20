 module "terraform_state_backend" {
    source        = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.33.0"
    namespace     = var.project
    stage         = var.environment
    name          = "${var.AWS_REGION}-terraform"
    attributes    = ["state"]
//    region        = var.AWS_REGION


    terraform_backend_config_file_path = "."
    terraform_backend_config_file_name = "backend.tf"
    force_destroy                      = false
 }