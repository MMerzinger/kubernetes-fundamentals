# Ingress Demo

This demo uses the following two applications to demonstrate the ingress concept of Kubernetes:
- [Guestbook](https://github.com/kubernetes/examples/blob/master/guestbook/all-in-one/guestbook-all-in-one.yaml) application from the [Kubernetes examples](https://github.com/kubernetes/examples) repository. It is licensed under [Apache License 2.0](https://github.com/kubernetes/examples/blob/master/LICENSE).
- [Azure Voting App](https://github.com/Azure-Samples/azure-voting-app-redis/blob/master/azure-vote-all-in-one-redis.yaml) application from the [Azure Voting App](https://github.com/Azure-Samples/azure-voting-app-redis) repository. It is licensed under [MIT License](https://github.com/Azure-Samples/azure-voting-app-redis/blob/master/LICENSE).

## Setup

It is a minimal demo, hence no namespace etc. are used. Resources are deployed as is.

1. Create the ingress controller
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml
```
2. Create the guestbook application
```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook/all-in-one/guestbook-all-in-one.yaml
```
3. Create the Azure Voting app
```bash
kubectl apply -f https://raw.githubusercontent.com/Azure-Samples/azure-voting-app-redis/master/azure-vote-all-in-one-redis.yaml
```
4. Check if everything is up and running
5. Deploy ingress spec
6. Test routes


## Cleanup

```bash
kubectl delete -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook/all-in-one/guestbook-all-in-one.yaml

kubectl delete -f https://raw.githubusercontent.com/Azure-Samples/azure-voting-app-redis/master/azure-vote-all-in-one-redis.yaml

kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml

```