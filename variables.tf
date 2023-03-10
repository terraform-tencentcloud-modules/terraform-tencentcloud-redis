variable "create_redis_instance" {
  description = "Whether to create redis instance."
  type        = bool
  default     = true
}

variable "project_id" {
  description = "Specifies which project the instance should belong to."
  type        = number
  default     = 0
}

variable "vpc_id" {
  description = "ID of the vpc with which the instance is to be associated."
  type        = string
  default     = ""
}

variable "redis_subnet_id" {
  description = "Specifies which subnet the instance should belong to."
  type        = string
  default     = ""
}

variable "redis_availability_zone" {
  description = "The available zone ID of an instance to be created, please refer to tencentcloud_redis_zone_config.list"
  type        = string
  default     = ""
}

variable "redis_type_id" {
  description = "Instance type. Available values reference data source"
  type        = number
  default     = 6
}

variable "no_auth" {
  description = "Indicates whether the redis instance support no-auth access. NOTE: Only available in private cloud environment."
  type        = bool
  default     = false
}

variable "redis_password" {
  description = "Password for a Redis user, which should be 8 to 16 characters. NOTE: Only no_auth=true specified can make password empty."
  type        = string
  default     = ""
}

variable "redis_mem_size" {
  description = "The memory volume of an available instance(in MB), please refer to tencentcloud_redis_zone_config.list[zone].shard_memories. When redis is standard type, it represents total memory size of the instance; when Redis is cluster type, it represents memory size of per sharding."
  type        = number
  default     = 8192
}

variable "redis_shard_num" {
  description = "The number of instance shard, default is 1. This is not required for standalone and master slave versions."
  type        = number
  default     = 1
}

variable "redis_replicas_num" {
  description = "The number of instance copies. This is not required for standalone and master slave versions and must equal to count of replica_zone_ids."
  type        = number
  default     = 1
}

variable "redis_name" {
  description = "Instance name."
  type        = string
  default     = ""
}

variable "redis_port" {
  description = "The port used to access a redis instance. The default value is 6379. And this value can't be changed after creation, or the Redis instance will be recreated."
  type        = number
  default     = 6379
}

variable "redis_charge_type" {
  description = "The charge type of instance. Valid values: PREPAID and POSTPAID. Default value is POSTPAID. Note: TencentCloud International only supports POSTPAID. Caution that update operation on this field will delete old instances and create new with new charge type."
  type        = string
  default     = "POSTPAID"
}

variable "redis_security_groups" {
  description = "ID of security group. If both vpc_id and subnet_id are not set, this argument should not be set either."
  type        = list(string)
  default     = [""]
}

variable "redis_tags" {
  description = "Instance tags."
  type        = map(string)
  default     = {}
}

variable "params_template_id" {
  description = "Specify params template id. If not set, will use default template."
  type        = string
  default     = ""
}

#redis backup
variable "create_redis_backup_config" {
  description = "Whether to create redis backup config."
  type        = bool
  default     = true
}

variable "redis_backup_time" {
  description = "Specifys what time the backup action should take place. And the time interval should be one hour."
  type        = string
  default     = "06:00-07:00"
}

variable "redis_backup_period" {
  description = "Valid values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday."
  type        = list(string)
  default     = []
}

variable "redis_id" {
  description = "ID of a redis instance to which the policy will be applied."
  type        = string
  default     = ""
}

#redis param_template
variable "create_redis_param_template" {
  description = "Whether to create redis backup config."
  type        = bool
  default     = true
}

variable "redis_param_template_name" {
  description = "Parameter template name."
  type        = string
  default     = ""
}

variable "template_id" {
  description = "Parameter template id description"
  type        = string
  default     = ""
}

variable "redis_template_product_type" {
  description = "Specify product type. Valid values: 1 (Redis 2.8 Memory Edition in cluster architecture), 2 (Redis 2.8 Memory Edition in standard architecture), 3 (CKV 3.2 Memory Edition in standard architecture), 4 (CKV 3.2 Memory Edition in cluster architecture), 5 (Redis 2.8 Memory Edition in standalone architecture), 6 (Redis 4.0 Memory Edition in standard architecture), 7 (Redis 4.0 Memory Edition in cluster architecture), 8 (Redis 5.0 Memory Edition in standard architecture), 9 (Redis 5.0 Memory Edition in cluster architecture). If template_id is specified, this parameter can be left blank; otherwise, it is required."
  type = number
  default = 6
}

variable "params_override" {
  description = "A list of parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "params_template_description" {
  description = "Parameter template description."
  type        = string
  default     = ""
}