#--- provider
#--- common config

#region module vpc ============================================================
vpc_main_network_block = "10.51.0.0/20"
waf_name               = "waf"
private_subnets        = ["10.51.0.0/23", "10.51.2.0/23", "10.51.4.0/23"]
public_subnets         = ["10.51.6.0/23", "10.51.8.0/23", "10.51.10.0/23"]
availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
