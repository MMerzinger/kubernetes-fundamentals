# Solution

Run `kubectl describe po task-3` and look at the output, here an example:

```bash
Name:         task-3
Namespace:    default
Priority:     0
Node:         aks-default-13651923-vmss000000/10.240.0.4
Start Time:   Sat, 11 Sep 2021 12:27:33 +0200
Labels:       <none>
Annotations:  <none>
Status:       Running
IP:           10.244.0.28
IPs:
  IP:  10.244.0.28
Containers:
  ubuntu:
    Container ID:  containerd://73003c1032229a4f32bcec344165babc161472b4bc5761e17c755ecd0955064c
    Image:         ubuntu
    Image ID:      docker.io/library/ubuntu@sha256:9d6a8699fb5c9c39cf08a0871bd6219f0400981c570894cd8cbea30d3424a31f
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
      -c
    Args:
      echo "Nothing to do - exiting"
    State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Sat, 11 Sep 2021 12:27:36 +0200
      Finished:     Sat, 11 Sep 2021 12:27:36 +0200
    Ready:          False
    Restart Count:  1
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-ncwf9 (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             False
  ContainersReady   False
  PodScheduled      True
Volumes:
  kube-api-access-ncwf9:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                From               Message
  ----     ------     ----               ----               -------
  Normal   Scheduled  13s                default-scheduler  Successfully assigned default/task-3 to aks-default-13651923-vmss000000
  Normal   Pulled     11s                kubelet            Successfully pulled image "ubuntu" in 1.908935558s
  Normal   Pulling    10s (x2 over 13s)  kubelet            Pulling image "ubuntu"
  Normal   Created    10s (x2 over 11s)  kubelet            Created container ubuntu
  Normal   Started    10s (x2 over 11s)  kubelet            Started container ubuntu
  Normal   Pulled     10s                kubelet            Successfully pulled image "ubuntu" in 743.113106ms
  Warning  BackOff    8s (x2 over 9s)    kubelet            Back-off restarting failed container
```

As you can see under Containers -> ubuntu -> Last State -> Reason -> Completed. The pod stopped as the process ran to completion. This causes Kubernetes to restart this pod by default, hence ending up in the CrashLoopBackOff status.