profile=maitho
region=us-east-1
k8s_cluster=Jambo-cluster
namespace=login-app
service=login-app-service
ingress=login-app-ingress

update-kubeconfig:
	AWS_PROFILE=$(profile) aws eks update-kubeconfig --region "$(region)" --name "$(k8s_cluster)"

create-namespace:
	kubectl create namespace $(namespace)
get-namespace:
	kubectl get namespace
delete-namespace:
	kubectl delete namespace $(namespace)

deploy-mysql-manifest:
	kubectl apply -f mysql-manifest/
delete-mysql-manifest:
	kubectl delete -f mysql-manifest/

deploy-svc-lb-manifest:
	kubectl apply -f svc-lb-manifest/
delete-svc-lb-manifest:
	kubectl delete -f svc-lb-manifest/

deploy-login-manifest:
	kubectl apply -f login-manifest/
delete-login-manifest:
	kubectl delete -f login-manifest/

get-mysql-logs:
	kubectl -n $(namespace) logs -f $(kubectl -n login-app get pod -l app=mysql -o name)
get-lb:
	kubectl -n $(namespace) get svc $(service) -o json | jq -r .status.loadBalancer.ingress[].hostname
# Load Balancer DNS
nslookup:
	nslookup $(lb)

get-pods:
	kubectl get pods -n $(namespace)
get-pods-wide:
	kubectl get pods -A -o wide
describe-pod:
	kubectl -n $(namespace) describe pod $(pod)

get-service:
	kubectl get svc -n $(namespace)
get-service-watch:
	kubectl get svc -n $(namespace)	--watch
describe-service:
	kubectl -n $(namespace) describe svc $(service)

get-nodes:
	kubectl get nodes
get-nodes-wide:
	kubectl get nodes -o wide
describe-node:
	kubectl describe node $(node)
describe-ingress:
	kubectl -n $(namespace) describe ing $(ingress)

get-crds: #custom resource definitios
	kubectl get crds
describe-crd:
	kubectl describe crd $(crd)

running-pods:
	kubectl get pods --all-namespaces | grep -i running | wc -l

exec-pod:
	kubectl exec -n $(namespace) -it $(pod) bash

pod-logs:
	kubectl -n $(namespace) logs -f $(pod)
