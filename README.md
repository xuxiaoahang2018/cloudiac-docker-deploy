## 使用说明

该模块会在阿里云服务上创建ecs服务器，并在该Ecs服务器上安装docker, docker-compose 并且部署CloudIac 服务.


## 使用步骤

1. 配置创建阿里云服务所需要的公钥/私钥 到环境变量中
```
export ALICLOUD_ACCESS_KEY= 你的akid
export ALICLOUD_SECRET_KEY= 你的ak_secret
export ALICLOUD_REGION=cn-beijing
```
2.执行terraform 命令
```
terraform init
terraform apply
```

运行完成以上步骤后将在北京区域创建一台ecs，根据该ecs的公网ip 直接访问80端口即可访问部署CloudIac服务.

