# Solution

A pod that specifies a liveness probe has to fulfill this probe at a certain interval. Is it not successful then Kubernetes will count towards a threshold. If the pod exceeds this threshold then it will be restarted. In our case the probe fails three times (10s interval) and then the pod gets restarted. To fix this problem, we need to set the liveness probe to the correct port `80`. 

Have a look at `pod-solution.yaml` and create it via `kubectl apply -f pod-solution.yaml`. The liveness probe will not restart the container anymore.