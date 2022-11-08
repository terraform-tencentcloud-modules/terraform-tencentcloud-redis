data "tencentcloud_vpc_subnets" "selected_vpc" {
  subnet_id = var.subnet_id
}
