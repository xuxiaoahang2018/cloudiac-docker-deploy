variable "instance_number" {
  default = 1
  description = "创建ecs服务器数据量，默认值为一台"
}

variable "instance_type" {
  default = "ecs.n2.small"
  description = "创建ecs服务器实例规格"
}

variable "instance_name" {
  default = "tf_ecs_test5"
  description = "创建的ecs服务器名称"
}

variable "availability_zone" {
  default = "cn-beijing-b"
  description = "可用区域"
}

variable "security_group_name" {
  default = "yunji_default"
  description = "安全组名称"
}

variable "iac_portal" {
  default = "cloudiac/iac-portal:latest"
  description = "iac-portal 镜像地址以及版本"
}

variable "ct_runner" {
  default = "cloudiac/ct-runner:latest"
  description = "ct-runner 镜像地址以及版本"
}

variable "ct_worker" {
  default = "cloudiac/ct-worker:latest"
  description = "ct-worker 镜像地址以及版本"
}

variable "iac_web" {
  default = "cloudiac/iac-web:latest"
  description = "iac-web 镜像地址以及版本"
}

variable "mysql" {
  default = "mysql:5.7"
  description = "mysql 镜像地址以及版本"
}

variable "consul" {
  default = "consul:latest"
  description = "consul 镜像地址以及版本"
}

variable "user" {
  default = "root"
  description = "ssh 连接机器用户名"
  sensitive = true
}

variable "password" {
  default = "User@1234"
  description = "ssh 连接机器密码"
  sensitive = true
}

variable "docker_pw" {
}