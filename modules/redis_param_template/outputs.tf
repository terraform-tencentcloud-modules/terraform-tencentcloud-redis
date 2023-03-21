output "redis_param_template_id" {
  description = "param template id which returned by the param template resource created, If not created, returns empty string."
  value       = try(tencentcloud_redis_param_template.this[0].id, "")
}
