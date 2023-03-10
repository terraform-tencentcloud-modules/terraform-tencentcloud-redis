provider "tencentcloud" {
  region = "ap-shanghai"
}

resource "tencentcloud_vpc" "main" {
  name       = "test-vpc"
  cidr_block = "10.0.0.0/16"
  tags = {
    "createBy" = "terraform"
  }
}

resource "tencentcloud_subnet" "subnet" {
  availability_zone = "ap-shanghai-1"
  name              = "test-subnet"
  vpc_id            = tencentcloud_vpc.main.id
  cidr_block        = "10.0.20.0/28"
  is_multicast      = false
  tags = {
    "createBy" = "terraform"
  }
}

module "redis" {
  source = "../../"

  # Redis instance
  vpc_id = tencentcloud_vpc.main.id
  redis_availability_zone = "ap-shanghai-1"
  redis_subnet_id = tencentcloud_subnet.subnet.id
  redis_type_id = 2
  redis_password = "your_password"
  redis_mem_size = 1024
  redis_replicas_num = 1
  redis_name = "tftest-redis"
  #charge type
  redis_charge_type = "POSTPAID"
  #security
  redis_security_groups = [module.security-group.security_group_id]
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

module "security-group" {
    source = "terraform-tencentcloud-modules/security-group/tencentcloud"
    name   = "sg-tf-redis-test"
    #vpc_id = tencentcloud_vpc.main.id
    ingress_with_cidr_blocks = [
        {
          port        = "6379"
          protocol    = "TCP"
          cidr_block  = "10.0.20.0/28"
          policy      = "accept"
          description = "simple-security-group"
        },
      ]

      egress_with_cidr_blocks = [
        {
          port        = "6379"
          protocol    = "TCP"
          cidr_block  = "10.0.20.0/28"
          policy      = "accept"
          description = "simple-security-group"
        }
      ]
}
