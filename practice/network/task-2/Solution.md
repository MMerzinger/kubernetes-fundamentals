# Solution

The service uses the type LoadBalancer, hence it will be exposed to the internet.

The service selector matches the deployment (app: task-2), but the port is wrong. The service will send traffic to port 8080 on the deployment pods, but they are listening on port 80.