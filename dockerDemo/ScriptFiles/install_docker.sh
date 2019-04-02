dockerFun(){
    yes | yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
    yes | yum install -y yum-utils device-mapper-persistent-data lvm2
    yes | yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
    yes | yum makecache fast
    yes | yum -y install docker-ce
    yes | systemctl start docker
    yes | yum -y install dstat
    return 1
}
dockerFun
#echo "docker install finished!"

