# demo-k8s

This tf template will deploy the following helm charts

1. counter application helm chart with first name as env variable
2. mysql with db and table creation
3. loki stack (prom, grafana, alert-manager, node exporter etc.,) with a k8's cluster monitoring dashbaord as code


## How it works

The env variable value is set under counter/values.yaml

env:

variable: "MYNAME" # Dont change this

value: "PrabhuThanga" # You can change with your name

## Prerequisite 

1. you have a docker-desktop enabled with k8s cluster or minikube or kind
2. your config file is available in ~/.kube/config
3. terraform required_version = "~> 1.3.0"
4. update the image (thangap05/demo-nsearch) and image tag (latest) in counter/values.yaml

## How to update predefined values

goto counter/values.yaml and update variables like image or image tag, replicas count etc.,

## How to Deploy ?
```
git clone https://gitlab.com/cloud5680312/demo-k8s.git
cd demo-k8s
terraform init
terraform plan -out tf.plan
terraform apply tf.plan
```
## Post-Deployment

1. To view the grafana dashboard, get your password

```
k get secret loki-grafana -o yaml -n loki |grep admin-password | head -1 |cut -d ":" -f2 |base64 -D

```

2. Port forward the grafana services and visit http://127.0.0.1:8089 
   username "admin" and password from above output. once logged in you can see the dashbaord "Kubernetes Cluster" gives all the resource details

```
k port-forward service/loki-grafana 8089:80 -n loki

```

3. To view the counter application and visit http://127.0.0.1:8088

```
k port-forward service/counter-svc 8088:80 -n counter

```

4. mysql service is available to use from counter application as "mysql.mysql.svc.cluster.local:3306" with root password "pass123"


