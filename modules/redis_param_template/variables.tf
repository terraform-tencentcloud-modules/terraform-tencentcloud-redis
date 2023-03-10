variable "create" {
  description = "Whether to create redis param template."
  type        = bool
  default     = false
}

variable "name" {
  description = "Parameter template name."
  type        = string
  default     = ""
}

variable "description" {
  description = "Parameter template description"
  type        = string
  default     = ""
}

variable "product_type" {
  description = "Specify product type. Valid values: 1 (Redis 2.8 Memory Edition in cluster architecture), 2 (Redis 2.8 Memory Edition in standard architecture), 3 (CKV 3.2 Memory Edition in standard architecture), 4 (CKV 3.2 Memory Edition in cluster architecture), 5 (Redis 2.8 Memory Edition in standalone architecture), 6 (Redis 4.0 Memory Edition in standard architecture), 7 (Redis 4.0 Memory Edition in cluster architecture), 8 (Redis 5.0 Memory Edition in standard architecture), 9 (Redis 5.0 Memory Edition in cluster architecture). If template_id is specified, this parameter can be left blank; otherwise, it is required."
  type        = number
  default     = 1
}

variable "params_override" {
  description = "A list of parameter maps to apply"
  type        = list(map(string))
  default     = []
}
