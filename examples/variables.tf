variable "region" {
  default = "ap-shanghai"
}

variable "project_id" {
  default = 0
}

//Redis
variable "subnet_id" {
  default = "subnet-a23wlqvp"
}

variable "redis_type_id" {
  default = 6
}

variable "redis_password" {
  default = "Tencnet123t,"
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
  default = "tf-mod-test"
}

variable "redis_port" {
  default = 6379
}

variable "redis_charge_type" {
  default = "POSTPAID"
}

variable "redis_security_groups"{
  default = ["sg-mqt0sgo4", "sg-llv4ingm"]
}

variable "redis_tags" {
  type    = map(string)
  default = {2:3}
}

#redis backup
variable "redis_backup_time" {
  default = "06:00-07:00"
}
