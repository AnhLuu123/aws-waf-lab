
# auto load provider from local file
provider "aws" {
  region                  = var.region
  alias                    = "local"
  access_key               = var.access_key
  secret_key               = var.secret_key
}

