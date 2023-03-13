resource "tencentcloud_redis_param_template" "this" {
  count = var.create ? 1 : 0

  name         = var.name
  description  = var.description
  product_type = var.template_id != "" ? null : var.product_type
  template_id  = var.template_id == "" ? null : var.template_id
  dynamic "params_override" {
    for_each = var.params_override
    content {
        key = params_override.value.key
        value = params_override.value.value
    }
  }
}
