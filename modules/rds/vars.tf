variable "allocated_storage"{

}

variable "engine"{
    type = string
}

variable "engine_version"{
    type = string
    default = ""
}

variable "instance_class"{
    type = string
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
  default = ""
}
 
variable "tags" {
  default     = {}
  type        = map(string)
  description = "A mapping of tags to assign to all resources."
}