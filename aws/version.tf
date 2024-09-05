terraform {
  required_version = ">= 1.0.3"
  backend "s3" {
    region  = "us-east-1"
    bucket  = "waf-lab-state"
    key     = "terraform.tfstate"
    encrypt = false
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
}
}
