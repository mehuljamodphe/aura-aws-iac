locals {
  full_name             = "${var.project}-${var.environment}-${var.application}"
  common_tags = {
    Application = var.application
    Creator     = var.Creator
    Environment = var.environment
  }
}