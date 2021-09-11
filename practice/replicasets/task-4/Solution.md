# Solution

`kubectl apply -f replicaset.yaml`

Run `kubectl scale replicaset task-4 --replicas=3` and observe what happens via `kubectl get po -w`. Pods are created until the desired amount of replicas are present.