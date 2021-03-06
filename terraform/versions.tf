terraform {
//  required_version = "~> 0.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    local = {
      source  = "hashicorp/local"
      //version = ">= 1.3"
    }
    template = {
      source  = "hashicorp/template"
      //version = ">= 2.0"
    }
    http = {
      source = "hashicorp/http"
    }
  }

}
