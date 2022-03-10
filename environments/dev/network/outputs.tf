output "vpc" {
  value = {
    vpc_id             = "${var.vpc_id}"
    cidr               = "${var.vpc_cidr}"
    private_subnet_ids = "${var.vpc_private_subnet_ids}"
    public_subnet_ids  = "${var.vpc_public_subnet_ids}"
    private_cidrs      = "${var.private_cidrs}"
    public_cidrs       = "${var.public_cidrs}"
    #nat_gateway_ids    = var.vpc.nat_gateway_ids
    #nat_gateway_public_ips = var.vpc.nat_gateway_public_ips
    #main_route_table_id     = var.main_route_table_id
    #public_route_table_id   = var.public_route_table
    #private_route_table_ids = var.private_route_tables
  }
}