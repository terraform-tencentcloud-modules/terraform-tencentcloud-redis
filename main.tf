locals {
    redis_id = var.redis_id == "" ? tencentcloud_redis_instance.this.id : var.redis_id
    params_template_id = var.create_redis_param_template ? module.redis_param_template.redis_param_template_id : var.params_template_id
}


################################################################################
# Instance
################################################################################

resource "tencentcloud_redis_instance" "this" {
  project_id = var.project_id

  #Redis Instance
  vpc_id             = var.vpc_id
  availability_zone  = var.redis_availability_zone
  subnet_id          = var.redis_subnet_id
  type_id            = var.redis_type_id
  no_auth            = var.no_auth
  password           = var.redis_password
  mem_size           = var.redis_mem_size
  redis_shard_num    = var.redis_shard_num
  redis_replicas_num = var.redis_replicas_num
  name               = var.redis_name
  port               = var.redis_port

  params_template_id = local.params_template_id

  #charge type
  charge_type = var.redis_charge_type

  #security
  security_groups = var.redis_security_groups

  tags = var.redis_tags
}

################################################################################
# Parameter Template
################################################################################

module "redis_param_template" {
  source = "./modules/redis_param_template"

  create = var.create_redis_param_template
  name   = var.redis_param_template_name
  description = var.params_template_description
  product_type = var.redis_template_product_type
  params_override = var.params_override
}

################################################################################
# Backup
################################################################################

module "redis_backup_config" {
  source = "./modules/redis_backup_config"

  create = var.create_redis_backup_config
  redis_id = local.redis_id
  backup_time = var.redis_backup_time
  backup_period = var.redis_backup_period
}
