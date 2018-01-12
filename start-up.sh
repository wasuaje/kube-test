
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

#usiog nginx rc at least nginx worked
kubectl create configmap nginxconfigmap --from-file=http-nginx/default.conf
kubectl expose service nginxsvc --type=LoadBalancer --name=service-test-app
#kubectl expose pod nginx-pv-pod --type=LoadBalancer --name=lb-nginx-test-app

docker build -t tiao/gb-frontend-flask-redis guestbook-flask/flask-redis
docker push tiao/gb-frontend-flask-redis