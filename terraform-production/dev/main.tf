module "servers" {
  source           = "../modules/vpc"
  aws_profile      = "personal"
  aws_region       = "us-east-1"
  vpcCIDRblock     = "10.1.0.0/16"
  instanceTenancy  = "default"
  dnsSupport       = true
  dnsHostNames     = true
  subnetCIDRblock  = "10.1.1.0/24"
  mapPublicIP      = true
  availabilityZone = "us-east-1b"
}
