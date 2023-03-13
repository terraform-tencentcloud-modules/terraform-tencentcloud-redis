# Redis Parameter Template Tencent Cloud Redis Terraform Module

## Resource

| Name | Type |
|------|------|
| [tencentcloud_redis_param_template.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/redis_param_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create redis param template. | bool | false | no 
| name | Parameter template name. | string | "" | yes
| description | Parameter template description. | string | "" | no
| product_type | Specify product type. Valid values: 1 (Redis 2.8 Memory Edition in cluster architecture), 2 (Redis 2.8 Memory Edition in standard architecture), 3 (CKV 3.2 Memory Edition in standard architecture), 4 (CKV 3.2 Memory Edition in cluster architecture), 5 (Redis 2.8 Memory Edition in standalone architecture), 6 (Redis 4.0 Memory Edition in standard architecture), 7 (Redis 4.0 Memory Edition in cluster architecture), 8 (Redis 5.0 Memory Edition in standard architecture), 9 (Redis 5.0 Memory Edition in cluster architecture).  If template_id is specified, this parameter can be left blank; otherwise, it is required. | number | "" | no
| template_id | Specify which existed template import from. | "" | no
| params_override | A list of parameter maps to apply. | list[map(string)] | [] | yes

## Outputs

| Name | Description |
|------|-------------|
| redis_param_template_id | ID of the resource. |


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
