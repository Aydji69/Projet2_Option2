provider "aws" {
  region = "us-east-1"
}

module "cluster1" {
  source          = "./kub-module"
  cluster_name    = "cluster1"
  cluster_version = "1.24"
  subnets         = ["subnet-123456", "subnet-789012"]
  vpc_id          = "vpc-123456"
  node_count      = 2
  node_min        = 1
  node_max        = 3
  instance_type   = "t3.medium"
}

module "cluster2" {
  source          = "./kub-module"
  cluster_name    = "cluster2"
  cluster_version = "1.24"
  subnets         = ["subnet-234567", "subnet-890123"]
  vpc_id          = "vpc-234567"
  node_count      = 3
  node_min        = 2
  node_max        = 4
  instance_type   = "t3.large"
}