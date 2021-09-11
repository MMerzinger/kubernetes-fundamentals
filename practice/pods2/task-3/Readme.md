# Solution

A pod that specifies a liveness probe has to fulfill this probe at a certain interval. Is it not successful then Kubernetes will count towards a threshold. If the pod exceeds this threshold then it will be restarted. In our case the probe fails three times (10s interval) and then the pod gets restarted.