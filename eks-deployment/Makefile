profile=maitho
region=us-east-1
k8s_cluster=Jambo-cluster
namespace=login-app
service=login-app-service

update-kubeconfig:
	AWS_PROFILE=$(profile) aws eks update-kubeconfig --region "$(region)" --name "$(k8s_cluster)"

create-namespace:
	kubectl create namespace $(namespace)
get-namespace:
	kubectl get namespace
delete-namespace:
	kubectl delete namespace $(namespace)

get-pods:
	kubectl get pods -n $(namespace)
get-service:
	kubectl get svc -n $(namespace)
get-service-watch:
	kubectl get svc -n $(namespace)	--watch
describe-service:
	kubectl -n $(namespace) describe svc $(service)

describe-pod:
	kubectl  -n $(namespace) describe pod $(pod)

get-nodes:
	kubectl get nodes
get-nodes-wide:
	kubectl get nodes -o wide
describe-node:
	kubectl describe node $(node)

deploy-app:
	kubectl apply -f login-deployment.yml
delete-app:
	kubectl delete -f login-deployment.yml
deploy-service:
	kubectl apply -f login-service.yml
delete-service:
	kubectl delete -f login-service.yml

running-pods:
	kubectl get pods --all-namespaces | grep -i running | wc -l

exec-pod:
	kubectl exec -n $(namespace) -it $(pod) bash

pod-logs:
	kubectl -n $(namespace) logs -f $(pod)

nslookup:
	nslookup $(lb) #loadbalancer