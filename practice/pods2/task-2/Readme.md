# Solution

`kubectl apply -f pod-solution.yaml`

Running `kubectl logs task-2` will fail as kubectl does not know which container is meant. Therefore, you have to specifiy the container name. E.g. `kubectl logs task-2 nginx`.