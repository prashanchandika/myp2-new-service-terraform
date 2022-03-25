variable "vpc_id" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type    = string
  default = ""
}

variable "vpc_private_subnet_ids" {
  type    = list(string)
  default = []
}
variable "vpc_public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "public_cidrs" {
  type    = list(string)
  default = []
}
variable "private_cidrs" {
  type    = list(string)
  default = []
}



