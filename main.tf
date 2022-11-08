provider "tencentcloud" {
  region = var.region
}


resource "tencentcloud_redis_instance" "redis" {
  project_id = var.project_id

  #Redis Instance
  vpc_id             = var.vpc_id
  availability_zone  = var.redis_availability_zone
  subnet_id          = var.redis_subnet_id
  type_id            = var.redis_type_id
  password           = var.redis_password
  mem_size           = var.redis_mem_size
  redis_shard_num    = var.redis_shard_num
  redis_replicas_num = var.redis_replicas_num
  name               = var.redis_name
  port               = var.redis_port

  #charge type
  charge_type = var.redis_charge_type

  #security
  security_groups = var.redis_security_groups

  tags = var.redis_tags
}

resource "tencentcloud_redis_backup_config" "redis-backup" {
  redis_id    = tencentcloud_redis_instance.redis.id
  backup_time = var.redis_backup_time
}
