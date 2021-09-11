# Solution

1. Build the docker image:
- `cd demo-status-backend/`
- `docker build --tag <YOUR-REGISTRY>/demo-app:v1 --target final -f Dockerfile .`
- `docker login <YOUR-REGISTRY>`
  - Use the credentials provided by the mail.
- `docker push <YOUR-REGISTRY>/demo-app:v1` 

If you do not have access to Docker then use the image `marcmer/demo-app:v1`.

Get the IP of your ingress controller with `kubectl get svc –n ingress-nginx`. Go into the file `challenge-4.yaml` and replace "<PUBLIC-IP>" with the IP. Now you can just deploy with `kubectl apply -f challenge-4.yaml` and then access the url. You should see a greeting from the pod that is answering.