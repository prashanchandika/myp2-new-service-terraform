resource "aws_db_instance" "rds1" {
  allocated_storage   = var.allocated_storage
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  db_name             = "${var.rds_name}"
  identifier          = var.identifier
  username            = var.username
  password            = var.password
  parameter_group_name  = var.parameter_group_name
  skip_final_snapshot = var.skip_final_snapshot

  publicly_accessible = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.subnet_rds.id
#  security_group_names = [aws_security_group.nsg_rds.id]
  vpc_security_group_ids = [aws_security_group.nsg_rds.id]
  tags                = var.tags
}


resource "aws_db_subnet_group" "subnet_rds" {
  name       = "${var.rds_name}-${var.deployment_identifier}-subnetgroup"
  subnet_ids = var.db_subnet_ids

  tags = var.tags
}

#Security Group for RDS
resource "aws_security_group" "nsg_rds" {
  name        = "${var.rds_name}-${var.deployment_identifier}-sg"
  description = "Allow connections on DB Port"
  vpc_id      = var.vpc_id

  tags = var.tags
}

resource "aws_security_group_rule" "nsg_rds_ingress_rule" {
  description              = "Allow connections on DB Port"
  type                     = "ingress"
  from_port                = "${var.db_port}"
  to_port                  = "${var.db_port}"
  protocol                 = "tcp"
#  source_security_group_id = aws_security_group.nsg_task.id
  cidr_blocks              =  ["0.0.0.0/0"]
  security_group_id = aws_security_group.nsg_rds.id
}

resource "aws_security_group_rule" "nsg_rds_egress_rule" {
  description              = "Allow connections on DB Port"
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = -1
#  source_security_group_id = aws_security_group.nsg_task.id
  cidr_blocks              =  ["0.0.0.0/0"]
  security_group_id = aws_security_group.nsg_rds.id
}