pathiso=$1
VMname=$2
diskroom=$3
ram=$4
vcpus=$5

echo "name: ${VMname}"
echo "ram:  ${ram}"
echo "disk: ${VMname}.raw ${diskroom}"
echo "ios:  ${pathiso}"
qemu-img create -f raw ${VMname}.raw $diskroom
qemu-img info ${VMname}.raw

is_r6=`cat /etc/redhat-release | grep "release 6[.]" | wc -l`

if [ $is_r6 -eq 1 ] ; then
	virt-install --name $VMname --ram $ram --vcpus=$vcpus --disk path=${VMname}.raw  --network bridge=br0  --cdrom $pathiso --vnclisten=0.0.0.0 --vncport=5900 --vnc

fi

is_r7=`cat /etc/redhat-release | grep "release 7[.]" | wc -l`

if [ $is_r7 -eq 1 ] ; then
	virt-install --virt-type kvm --name $VMname --ram $ram --vcpus=$vcpus --cdrom=$pathiso --disk path=${VMname}.raw --network bridge=br0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole
fi
