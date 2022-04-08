variable "allocated_storage"{
  default = 10

}

variable "create_rds" {
  type = bool
  default = false
}

variable "engine"{
    type = string
    default = "postgres"
}

variable "engine_version"{
    type = string
    default = "12.7"
}

variable "instance_class"{
    type = string
    default ="db.t3.micro"
}

variable "rds_name"{
    type = string
    default = "testrds"
}

variable "identifier"{
    type = string
}

variable "username"{
    type = string
}

variable "password"{
    type = string
}

variable "skip_final_snapshot"{
    type = bool
    default = true
}

variable "publicly_accessible"{
    type = bool
    default = true
}

variable "deployment_identifier" {
  description = "An identifier for this instantiation."
  type        = string
  default     = "dev"
}

variable "db_subnet_ids"{
    type    = list(string)
    default = []
}

variable "vpc_id" {
  type    = string
  default = ""
}

variable "db_port" {
  type    = string
  default = "5432"
}

variable "parameter_group_name" {
  type    = string
  default = "default.postgres12"
}
 
variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}