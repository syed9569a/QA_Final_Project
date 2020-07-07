data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "public_subnets" {

    count = 2
    
    vpc_id = var.vpc_id

    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)

    availability_zone = data.aws_availability_zones.available.names[count.index]

    map_public_ip_on_launch = true

    tags = {
        "kubernetes.io/cluster/syed_cluster" = "shared"
    }  

}

# resource "aws_subnet" "public_subnet_2" {
    
#     vpc_id = var.vpc_id

#     cidr_block = var.cidr_2

#     availability_zone = data.aws_availability_zones.available.names[1]

#     map_public_ip_on_launch = true

#     tags = {
#         "kubernetes.io/cluster/syed_cluster" = "shared"
#         "kubernetes.io/role/elb" = "1"
#     }  

# }
