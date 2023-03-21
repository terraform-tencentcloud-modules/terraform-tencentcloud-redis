variable "create" {
  description = "Whether to create redis backup config."
  type        = bool
  default     = true
}

variable "redis_id" {
  description = "ID of a redis instance to which the policy will be applied."
  type        = string
  default     = ""
}

variable "backup_time" {
  description = "Specifys what time the backup action should take place. And the time interval should be one hour."
  type        = string
  default     = "05:00-06:00"
}

variable "backup_period" {
  description = "Valid values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday."
  type        = list(string)
  default     = []
}