daemonFun(){
        fileFolder = "/etc/docker"
        if [! -x "$fileFolder"];then
                mkdir "$fileFolder"
        fi
        file = "/etc/docker/zh.txt"
        if [ -f "$file" ];then
                rm -rf /etc/docker/zh.txt
                touch "/etc/docker/zh.txt"
                echo "write test" > /etc/docker/zh.txt
                echo "exist!!"
        else
                touch "/etc/docker/zh.txt"
                echo "write test" > /etc/docker/zh.txt
                echo "not found."
        fi
        return 1
}
daemonFun

test(){
folder="/home/ljc/"
if [ -d "$folder" ] ; then
#        mkdir "$dire"
        rmdir "$folder"
fi
#mkdir "$dire"
}
test