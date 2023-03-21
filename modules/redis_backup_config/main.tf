resource "tencentcloud_redis_backup_config" "this" {
  count = var.create ? 1 : 0

  redis_id       = var.redis_id
  backup_time    = var.backup_time
  backup_period  = var.backup_period
}
