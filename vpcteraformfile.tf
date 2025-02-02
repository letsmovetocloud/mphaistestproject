# Create VPC Terraform module in us-east region
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  

  # VPC Basic Details
  name = "vpc-dev"

  cidr = "10.1.0.0/16"   
  azs                 = ["ap-south-1a", "ap-south-2b"]
  private_subnets     = ["10.1.1.0/24"]
  public_subnets      = ["10.1.101.0/24"]



  # Database Subnets
  create_database_subnet_group = false
  create_database_subnet_route_table= true
  database_subnets    = ["172.21.151.0/24"]


  create_database_nat_gateway_route = true
  create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner = "vpclab"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev-terraform lab"
  }
}



