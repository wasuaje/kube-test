# Kube-test


This is a personal kubernetes test stack made to put practice some knowledge


**First steps**

Run this in a *Kubernetes* cluster with one or more nodes

```
yum install -y git vim dos2unix
git clone https://github.com/wasuaje/kube-test.git
```

**Later**

Just run this script to bring everything up (hopefully ;))

```
./start-up.sh
```

**Check with pointing to a valid exposed cluster URL**

**Script content**
```
mkdir /tmp/data
kubectl create secret generic mysql-pass --from-literal=password=123456qwe
kubectl create -f mysql-deployment.yaml

kubectl create configmap nginxconfigmap --from-file=http-nginx/default.conf

kubectl create -f flask-deployment.yaml
kubectl create -f nginx-rc.yaml


kubectl expose service nginxsvc --type=LoadBalancer --port=80 --target-port=8000 --name=nginx-exposed
```

**Useful Commands for image managing**
```
docker build -t wasuaje/app-flask-mysql app-flask/
docker push wasuaje/app-flask-mysql 
docker run wasuaje/app-flask-mysql 
```   