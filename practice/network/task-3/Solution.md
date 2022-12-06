# Solution

Create a service imperatively via `kubectl expose deployment task-3 --port 80 --target-port 80  --type=LoadBalancer` or create the service with a YAML file:
`kubectl apply -f .`

Take a note of the public IP (External IP) and open in with port 8080 on your Browser:
`kubectl get svc`

You should see the default NGINX page.