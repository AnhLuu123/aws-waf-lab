locals {
  product_name = "lab-vt"
  aws_region   = "us-east-1"
  # accpunt to store the state file
  account_name     = "workload"
  account_id       = "905418051128"
  assume_role_name = "OrganizationAccountAccessRole"
  tags = {
    Terraform = "true",
    # ApplyImage  = "true"
  }
}
