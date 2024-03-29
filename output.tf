#################
# Redis Instance
#################
output "redis_instance_id" {
  description = "The instance id of redis."
  value = tencentcloud_redis_instance.this.id
}

output "create_time" {
  description = "The time when the instance was created."
  value = tencentcloud_redis_instance.this.create_time
}

output "ip" {
  description = "IP address of an instance."
  value = tencentcloud_redis_instance.this.ip
}

output "node_info" {
  description = "Readonly Primary/Replica nodes."
  value = tencentcloud_redis_instance.this.node_info
}

output "status" {
  description = "Current status of an instance, maybe: init, processing, online, isolate and todelete."
  value = tencentcloud_redis_instance.this.status
}

#################
# Backup
#################

output "redis_backup_config_id" {
  description = "backup config id which returned by the backup config resource created, If not created, returns empty string."
  value = module.redis_backup_config.redis_backup_config_id
}

#################
# Redis Template
#################

output "redis_param_template_id" {
  description = "param template id which returned by the param template resource created, If not created, returns empty string."
  value = module.redis_param_template.redis_param_template_id
}
