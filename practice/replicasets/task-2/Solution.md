# Solution

You can either scale the replicas up by changing the file to `replicas: 2` and then execute `kubectl apply -f replicaset.yaml`. The second option is to run `kubectl scale replicaset task-2 --replicas=2`.

Pods that are managed by a ReplicaSet are always suffixed as this is required to uniquely identify pods.