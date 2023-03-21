# Redis Backup Tencent Cloud Redis Terraform Module

## Resource

| Name | Type |
|------|------|
| [tencentcloud_redis_backup_config.this](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/redis_backup_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create | Whether to create redis backup config. | bool | true | no
| redis_id | ID of a redis instance to which the policy will be applied. | string | "" | yes 
| backup_time | Specifys what time the backup action should take place. And the time interval should be one hour. | string | "05:00-06:00" | no
| backup_period | It has been deprecated from version 1.58.2. It makes no difference to online config at all Specifys which day the backup action should take place. Valid values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday. | list[string] | "" | no

## Outputs

| Name | Description |
|------|-------------|
| redis_backup_config_id | ID of the resource. |


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
