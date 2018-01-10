
#
# git clone my repo
# ./start-up.sh
#
# kubelet --network-plugin=cni --network-plugin-dir=/etc/cni/net.d
# mkdir /home/test
# cd /home/test
# git clone https://github.com/wasuaje/kube-test.git
kubeadm init --apiserver-advertise-address $(hostname -i)
kubectl apply -n kube-system -f  "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"
mkdir /tmp/data
kubectl create -f pv-volume.yaml
kubectl create -f pv-claim.yaml
kubectl create secret generic mysql-pass --from-literal=password=123456qwe
kubectl create -f mysql-deployment.yaml
