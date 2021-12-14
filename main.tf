resource "alicloud_vpc" "vpc" {
  vpc_name       = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.0.0/21"
  zone_id = var.availability_zone
}

resource "alicloud_security_group" "default" {
  name = var.security_group_name
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_instance" "instance" {
  availability_zone = var.availability_zone
  security_groups = alicloud_security_group.default.*.id
  # series III
  instance_type        = var.instance_type
  system_disk_category = "cloud_efficiency"
  image_id             = "centos_8_4_x64_20G_alibase_20210824.vhd"
  instance_name        = var.instance_name
  vswitch_id = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out = 1
  password            = "User@123"
  provisioner  "remote-exec" {
   connection {
     type = "ssh"
     host = alicloud_instance.instance.public_ip
     user = "root"
     password = "User@123"
   }

   inline = [
      "export iac_portal=${var.iac_portal}",
      "export ct_runner=${var.ct_runner}",
      "export ct_worker=${var.ct_worker}",
      "export iac_web=${var.iac_web}",
      "export mysql=${var.mysql}",
      "export consul=${var.consul}",
      "curl https://cloudiac.oss-cn-beijing.aliyuncs.com/docker_deploy_new.sh | sh",
   ]
  }
	
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}


output "public_ip" {
   value = alicloud_instance.instance.public_ip
}
