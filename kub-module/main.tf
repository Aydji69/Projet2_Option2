provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  node_groups = {
    default = {
      desired_capacity = var.node_count
      max_capacity     = var.node_max
      min_capacity     = var.node_min
      instance_type    = var.instance_type
    }
  }

  tags = {
  Environment = "Development"
  Owner       = "IGningue"
}
}