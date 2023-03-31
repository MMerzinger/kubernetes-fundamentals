# Solution

This task shows how network policies behave when using services to connect to pods.

To start, we can apply all available resources  via `kubectl apply -f pods.yaml -f netpol.yaml`. If you want to use the solution, have a look at `netpol-solution.yaml`.

First, if we check the connection from the client to the webserver via `kubectl exec -it task-3-client -- wget task-3-webserver:8080` there will be no answer. Something is blocking.

From the overall setup, the traffic flow is as follows: client-pod -> webserver-service -> webserver-pod.

By checking the provided manifests, we can see that the client needs to connect to port 8080 of the service and the service forwards traffic to port 80 on the webserver. So far so ok, now check the network policy.

The network policy allows traffic to the webserver from the client on port 8080 and this is the problem. Changing the port to 80, re-apply the network policy and the next check should give a response:

```bash
kubectl exec -it task-3-client -- wget task-3-webserver:8080
Connecting to task-3-webserver:8080 (10.0.57.166:8080)
saving to 'index.html'
index.html           100% |********************************|   615  0:00:00 ETA
'index.html' saved
```

It is important to note that the network policy "looks" at the container ports and not the service ports.

Don't forget to delete all pods and network policies via `kubectl delete po,netpol --all`.