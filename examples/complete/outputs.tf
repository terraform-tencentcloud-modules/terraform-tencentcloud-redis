#################
# Redis Instance
#################
output "redis_instance_id" {
  description = "The instance id of redis."
  value = module.redis.redis_instance_id
}

output "create_time" {
  description = "The time when the instance was created."
  value = module.redis.create_time
}

output "ip" {
  description = "IP address of an instance."
  value = module.redis.ip
}

output "node_info" {
  description = "Readonly Primary/Replica nodes."
  value = module.redis.node_info
}

output "status" {
  description = "Current status of an instance, maybe: init, processing, online, isolate and todelete."
  value = module.redis.status
}

#################
# Backup
#################

output "redis_backup_config_id" {
  description = "backup config id which returned by the backup config resource created, If not created, returns empty string."
  value = module.redis.redis_backup_config_id
}

#################
# Redis Template
#################

output "redis_param_template_id" {
  description = "param template id which returned by the param template resource created, If not created, returns empty string."
  value = module.redis.redis_param_template_id
}
