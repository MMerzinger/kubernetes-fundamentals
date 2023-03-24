# Solution

Create the resources via `kubectl apply -f task-1/`.

Check the resouces via `kubectl get hpa,deploy,po`.

It might take a moment until the hpa received the necessary metrics and autoscaling starts. The deployment should scale up to the specified max 3 replicas by the HPA.