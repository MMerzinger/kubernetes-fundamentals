# Ingress Demo

This demo uses the following two applications to demonstrate the ingress concept of Kubernetes:
- [Bookinfo](https://github.com/istio/istio/tree/release-1.15/samples/bookinfo/platform/kube) application from the [Istio](https://github.com/istio/istio/tree/master) repository. It is licensed under [Apache License 2.0](https://github.com/istio/istio/blob/master/LICENSE).
- [Azure Voting App](https://github.com/Azure-Samples/azure-voting-app-redis/blob/master/azure-vote-all-in-one-redis.yaml) application from the [Azure Voting App](https://github.com/Azure-Samples/azure-voting-app-redis) repository. It is licensed under [MIT License](https://github.com/Azure-Samples/azure-voting-app-redis/blob/master/LICENSE).

## Setup

It is a minimal demo, hence no namespace etc. are used. Resources are deployed as is.

1. Create the ingress controller
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.6.4/deploy/static/provider/cloud/deploy.yaml
```
2. Create the bookinfo application
```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/bookinfo/platform/kube/bookinfo.yaml
```
3. Create the Azure Voting app
```bash
kubectl apply -f https://raw.githubusercontent.com/Azure-Samples/azure-voting-app-redis/master/azure-vote-all-in-one-redis.yaml
```
4. Check if everything is up and running
```bash
kubectl get po
```
5. Setup and deploy ingress spec
```bash
kubectl get svc -n ingress-nginx ingress-nginx-controller -o=jsonpath="{.status.loadBalancer.ingress[0].ip}"
# Setup host in ingress.yaml
kubectl apply -f ingress.yaml
```
6. Test hosts by visiting the nip.io url.

## Cleanup

```bash
kubectl delete -f https://raw.githubusercontent.com/istio/istio/release-1.15/samples/bookinfo/platform/kube/bookinfo.yaml

kubectl delete -f https://raw.githubusercontent.com/Azure-Samples/azure-voting-app-redis/master/azure-vote-all-in-one-redis.yaml

kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.6.4/deploy/static/provider/cloud/deploy.yaml

```