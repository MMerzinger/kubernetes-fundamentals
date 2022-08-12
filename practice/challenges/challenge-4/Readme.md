# Task

This folder contains a .NET Core application. Build this application and push it to your registry using the following commands:
- `cd demo-status-backend/`
- `docker build --tag <YOUR-REGISTRY>/demo-app:v1 --target final -f Dockerfile .`
- `docker push <YOUR-REGISTRY>/demo-app:v1` (don’t forget to login before pushing)

For those that do not have Docker: Use the image marcmer/demo-app:v1

Create a deployment of 3 replicas for this image and name it «challenge-5». Next create a service of type ClusterIP with port 8000 mapping to port 8000. Deploy and expose this deployment via Ingress under the host `<YOUR_INGRESS_IP>.nip.io` and path `/status`. After you deployed the resources, check the result.
- Templates can be found under `challenge-4.yaml` - be aware that these are incomplete and you need to add some details to them to work
- Get your ingress IP via `kubectl get svc -n ingress-nginx`
- Help: https://kubernetes.io/docs/concepts/services-networking/ingress/ 


Finally: Don’t forget to `kubectl delete -f challenge-4.yaml` if you used these templates.
