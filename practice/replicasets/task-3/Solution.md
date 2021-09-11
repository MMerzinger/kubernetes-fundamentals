# Solution

`kubectl apply -f replicaset.yaml`

Run `kubectl get po` and look at the age of these pods. Then run `kubectl get po -o yaml | kubectl delete -f -`. This will delete all pods. Next, run `kubectl get po`. Kubernetes will recreate new pods to match the desired amount of replicas. Look at the age to verify that these are fresh pods.