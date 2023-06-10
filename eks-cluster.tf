module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"

  cluster_name = "my-eks-cluster"  
  cluster_version = "1.27"

  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id


  cluster_endpoint_public_access  = true


  tags = {
    environment = "development"
    application = "myapp"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 3

      instance_types = ["t2.small"]
    }
  }
}