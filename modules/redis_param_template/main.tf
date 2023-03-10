resource "tencentcloud_redis_param_template" "this" {
  count = var.create ? 1 : 0

  name         = var.name
  description  = var.description
  product_type = var.product_type
  dynamic "params_override" {
    for_each = var.params_override
    content {
        key = params_override.value.key
        value = params_override.value.value
    }
  }
}
