# TencentCloud Redis for Terraform

## terraform-tencentcloud-redis

A terraform module used for create Redis instance, backup and Parameter Template

The following resources are included.

* [redis](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/redis_instance)
* [redis_backup_config](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/redis_backup_config)
* [redis_param_template](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/redis_param_template)

##Usage

See [`examples`](https://github.com/terraform-tencentcloud-modules/terraform-tencentcloud-redis/tree/main/examples)

```hcl
module "redis" {
  source = "terraform-tencentcloud-modules/redis/tencentcloud"

  # Redis instance
  vpc_id = "your_vpc_id"
  redis_availability_zone = "your_zone"
  redis_subnet_id = "your_subnet_id"
  redis_type_id = 2
  redis_password = "your_password"
  redis_mem_size = 1024
  redis_replicas_num = 1
  redis_name = "tftest-redis"
  #charge type
  redis_charge_type = "POSTPAID"
  #security
  redis_security_groups = ["your_security_group"]
  redis_tags = {
    type = "test"
  }

  # redis param template
  create_redis_param_template = true
  redis_param_template_name = "redis-param-template-test"
  redis_template_product_type = 2
  params_override = [
    {
       key = "hz"
       value = "20"
    },{
       key = "zset-max-ziplist-entries"
       value = "256"
    }
  ]

  # redis backup policy
  create_redis_backup_config = true
  redis_backup_time = "03:00-04:00"
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create_redis_instance | Whether to create redis instance. | bool | true | no
| redis_name | Instance name. | string | "" | no
| project_id | Specifies which project the instance should belong to. | number | 0 | no
| vpc_id | ID of the vpc with which the instance is to be associated. | string | "" | yes
| redis_subnet_id | Specifies which subnet the instance should belong to. | string | "" | yes
| redis_availability_zone | The available zone ID of an instance to be created, please refer to tencentcloud_redis_zone_config.list | string | "" | yes
| redis_type_id | Instance type. Available values reference data source | number | 6 | yes
| no_auth | Indicates whether the redis instance support no-auth access. NOTE: Only available in private cloud environment. | bool | false | no
| redis_password | Password for a Redis user, which should be 8 to 16 characters. NOTE: Only no_auth=true specified can make password empty. | string | "" | yes
| redis_mem_size | The memory volume of an available instance(in MB), please refer to tencentcloud_redis_zone_config.list[zone].shard_memories. When redis is standard type, it represents total memory size of the instance; when Redis is cluster type, it represents memory size of per sharding. | number | 8192 | no
| redis_shard_num | The number of instance shard, default is 1. This is not required for standalone and master slave versions. | number | 1 | no
| redis_replicas_num | The number of instance copies. This is not required for standalone and master slave versions and must equal to count of replica_zone_ids. | number | 1 | no
| redis_port | The port used to access a redis instance. The default value is 6379. And this value can't be changed after creation, or the Redis instance will be recreated. | number | 6379 | no
| redis_charge_type | The charge type of instance. Valid values: PREPAID and POSTPAID. Default value is POSTPAID. Note: TencentCloud International only supports POSTPAID. Caution that update operation on this field will delete old instances and create new with new charge type. | string | "POSTPAID" | true
| redis_security_groups | ID of security group. If both vpc_id and subnet_id are not set, this argument should not be set either. | list(string) | [""] | yes
| redis_tags | Instance tags. | map(string) | {} | no
| params_template_id | Specify params template id. If not set, will use default template. | string | "" | no
| create_redis_backup_config | Whether to create redis backup config. | bool | true | no
| redis_backup_time | Specifys what time the backup action should take place. And the time interval should be one hour. | string | "06:00-07:00" | no 
| redis_backup_period | It has been deprecated from version 1.58.2. Valid values: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday. | list(string) | [] | no
| redis_id | ID of a redis instance to which the policy will be applied. | string | "" | yes
| create_redis_param_template | Whether to create redis backup config. | bool | true | no
| redis_param_template_name | Parameter template name. | string | "" | yes
| redis_template_product_type | Specify product type. Valid values: 1 (Redis 2.8 Memory Edition in cluster architecture), 2 (Redis 2.8 Memory Edition in standard architecture), 3 (CKV 3.2 Memory Edition in standard architecture), 4 (CKV 3.2 Memory Edition in cluster architecture), 5 (Redis 2.8 Memory Edition in standalone architecture), 6 (Redis 4.0 Memory Edition in standard architecture), 7 (Redis 4.0 Memory Edition in cluster architecture), 8 (Redis 5.0 Memory Edition in standard architecture), 9 (Redis 5.0 Memory Edition in cluster architecture). | number | 6 | yes
| params_override | A list of parameter maps to apply | list(map(string)) | [] | no
| params_template_description | Parameter template description. | string | "" | no

## Outputs

| Name | Description |
|------|-------------|
| redis_instance_id | The instance id of redis. |
| create_time | The time when the instance was created. |
| ip | IP address of an instance. |
| node_info | Readonly Primary/Replica nodes. |
| status |Current status of an instance, maybe: init, processing, online, isolate and todelete. |
| redis_backup_config_id | backup config id which returned by the backup config resource created, If not created, returns empty string. |
| redis_param_template_id | param template id which returned by the param template resource created, If not created, returns empty string. |


## Authors

Created and maintained by [TencentCloud](https://github.com/tencentcloudstack/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
