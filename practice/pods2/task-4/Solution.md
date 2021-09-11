# Solution

`kubectl apply -f pod-solution.yaml`

To get the user that is executed by the container you can either look into the YAML via `kubectl get po task-5 -o yaml` or run the `id` command inside the container via `kubectl exec -it task-5 -- id`.