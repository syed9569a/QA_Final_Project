provider "aws" {
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "vpc" {
    source = "./VPC"
    vpc_cidr_block = "172.160.0.0/16"
}

module "subnet" {
    source = "./SUBNET"
    vpc_id = module.vpc.vpc_id
    vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "igw" {
    source = "./IGW"
    vpc_id = module.vpc.vpc_id
    subnet_1 = module.subnet.subnet_1
    subnet_2 = module.subnet.subnet_2
}

module "iam" {
    source = "./IAM"
}

module "eks" {
    source = "./EKS"
    subnet_ids = module.subnet.subnet_ids
    syed_cluster_iam_role_arn = module.iam.cluster_iam_role
    syed_node_iam_role_arn = module.iam.node_iam_role
    available_subnets = [module.subnet.subnet_1, module.subnet.subnet_2]

}