
#
# git clone 
# ./start-up.sh
#
# kubelet --network-plugin=cni --network-plugin-dir=/etc/cni/net.d

mkdir /tmp/data
kubectl create -f pv-volume.yaml
# kubectl create -f pv-claim.yaml
kubectl create secret generic mysql-pass --from-literal=password=123456qwe
kubectl create -f mysql-deployment.yaml
