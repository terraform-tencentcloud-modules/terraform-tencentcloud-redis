output "redis_backup_config_id" {
  description = "backup config id which returned by the backup config resource created, If not created, returns empty string."
  value       = try(tencentcloud_redis_backup_config.this[0].id, "")
}
