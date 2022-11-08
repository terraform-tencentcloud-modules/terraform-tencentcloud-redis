//Redis
module "staging-redis" {
  source       = "../"
  region       = var.region
  project_id   = var.project_id

  #redis instance
  redis_name = var.redis_name
  vpc_id = data.tencentcloud_vpc_subnets.selected_vpc.instance_list.0.vpc_id
  redis_availability_zone = data.tencentcloud_vpc_subnets.selected_vpc.instance_list.0.availability_zone
  redis_subnet_id = data.tencentcloud_vpc_subnets.selected_vpc.instance_list.0.subnet_id
  redis_type_id = var.redis_type_id
  redis_password = var.redis_password
  redis_mem_size = var.redis_mem_size
  redis_shard_num = var.redis_shard_num
  redis_port  = var.redis_port

  #Redis charge type
  redis_charge_type = var.redis_charge_type

  #Redis backup
  redis_backup_time = var.redis_backup_time

  #Redis security
  redis_security_groups = var.redis_security_groups

  redis_tags = var.redis_tags
}
