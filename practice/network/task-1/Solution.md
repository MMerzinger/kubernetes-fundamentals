# Solution approaches

1. Use the provided `full-solution.yaml`.
2. Use imperative commands:
  - Create the deployment: `kubectl create deploy task-1 --image=nginx`
  - Create the service: `kubectl create svc clusterip task-1 --tcp 8080:80`