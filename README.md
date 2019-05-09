简单登录界面

jenkins 安装容器脚本
#!/bin/bash
  imageId=`sudo docker images|grep -i registry.cn-shanghai.aliyuncs.com/xcsy/web|awk '{print $3}'`
  echo "simplelogin镜像ID = "$imageId 
  containId=`sudo docker ps -a |grep -i simplelogin|awk '{print $1}'`
  echo "simplelogin容器ID = "$containId
#判断是否存在旧的simplelogin镜像
  if simplelogin -z "$imageId"
  then
     echo "simplelogin镜像不存在"
  else 
     if simplelogin -z "$containId"
     then
         echo "simplelogin容器不存在"
     else
         echo "simplelogin容器将要被执行stop命令"
         sudo docker stop simplelogin
         echo "simplelogin容器处于stop状态"
     fi
     echo "旧Test镜像将要被删除"
     sudo docker rmi -f $imageId
     echo "成功删除旧simplelogin镜像" 
  fi


#构建simplelogin镜像
  sudo docker build -t registry.cn-shanghai.aliyuncs.com/xcsy/web:latest .
#判断是否存在旧的Tms容器
  if simplelogin -z "$containId"
  then
    echo "simplelogin容器不存在"
  else 
    echo "旧simplelogin容器将要被删除"
    sudo docker rm -f $containId
    echo "成功删除旧Test容器" 
  fi
#创建容器
  echo "开始创建新simplelogin容器"
  sudo docker run -itd -p 85:8081 --name simplelogin registry.cn-shanghai.aliyuncs.com/xcsy/web:latest
  echo "新simplelogin容器创建成功"