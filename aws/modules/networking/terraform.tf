terraform {
  required_version = ">= v1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63"
    }
  }
}
