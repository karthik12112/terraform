provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "servers" {
  source           = "../modules/vpc"
  aws_profile      = "personal"
  aws_region       = "us-east-1"
  vpcCIDRblock     = "10.2.0.0/16"
  instanceTenancy  = "default"
  dnsSupport       = true
  dnsHostNames     = true
  subnetCIDRblock  = "10.2.1.0/24"
  mapPublicIP      = true
  availabilityZone = "us-east-1a"
}

terraform {
  backend "s3" {
    bucket         = "karthik-terraform-state"
    key            = "stage"
    dynamodb_table = "terraform-state"
    region         = "us-east-1"
  }
}

# data "terraform_remote_state" "state" {
#   backend = "s3"
#   config = {
#     bucket         = var.s3_bucket_name
#     key            = var.env
#     dynamodb_table = var.dynamodb_table
#     region         = var.aws_region
#   }
# }
