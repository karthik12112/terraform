provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
module "state" {
  source         = "../../modules/state-resources"
  env            = var.env
  s3_bucket      = var.s3_bucket
  s3_bucket_name = var.s3_bucket_name
  dynamodb_table = var.dynamodb_table
}
