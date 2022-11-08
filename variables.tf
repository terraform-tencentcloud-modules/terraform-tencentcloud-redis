variable "region" {
  default = ""
}

variable "project_id" {
  default = 0
}

variable "vpc_id" {
  default = ""
}

variable "redis_availability_zone" {
  default = ""
}

variable "redis_subnet_id" {
  default = ""
}

variable "redis_type_id" {
  default = 6
}

variable "redis_password" {
  default = ""
}

variable "redis_mem_size" {
  default = 8192
}

variable "redis_shard_num" {
  default = 1
}

variable "redis_replicas_num" {
  default = 1
}

variable "redis_name" {
  default = ""
}

variable "redis_port" {
  default = 6379
}

variable "redis_charge_type" {
  default = ""
}

variable "redis_security_groups" {
  default = [""]
}

variable "redis_tags" {
  type    = map(string)
  default = {}
}

#redis backup
variable "redis_backup_time" {
  default = "06:00-07:00"
}
