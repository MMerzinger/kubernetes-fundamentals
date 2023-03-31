# Solution

The goal of this task is that you complete the provided manifests and validate if connectivity between client and webserver on port 80 works.

Starting with the pods - there is nothing to do, just create them `kubectl apply -f pods.yaml`. But please note their labels, client `app.kubernetes.io/name: client` and webserver `app.kubernetes.io/name: webserver`, we will need them later.

You can find the final solution for our network policies in `netpol-solution.yaml`. Below you find the explanation.

Now lets have a look at the `netpol.yaml` file. There are quite some questionmarks, we will go through each one:

## The label selector of network policy `task-1-client-network-policy` is empty

```yaml
  podSelector:
    matchLabels:
      ?
```

This means we need to specify on which pods it will apply. We know from the spec, that the policy is used for egress traffic. Mapped to our client/webserver example, we now know that this policy has to apply to the client pods. Therefore, we can extend the manifest as follows.

```yaml
  podSelector:
    matchLabels:
      app.kubernetes.io/name: client
```

## The label selector of network policy `task-1-allow-webserver-to-receive-traffic-from-client` is empty

This is the same game as before, but now our policy is used for ingress traffic, hence it has to apply for all webserver pods. We can extend the manifest as follows:

```yaml
  podSelector:
    matchLabels:
      app.kubernetes.io/name: webserver
```

## The ingress from label selector of network policy `task-1-allow-webserver-to-receive-traffic-from-client` is empty

Both previous cases show that you need to select pods that the policy will apply to. On the other hand, we also need to specify the counterpart of the pod - i.e. from where it is allowed to receive traffic, or to which endpoints it might communicate.

The provided `netpol.yaml` does not specify the `from` label selector for the ingress network policy of the webserver. By not specifying it, the network policy does not know from where we want to allow traffic exactly. Hence, we need to specify the client pod as source.

```yaml
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app.kubernetes.io/name: client
```

## Apply and validate

Now that our manifests are complete, we can go on and apply them via `kubectl apply -f netpol.yaml`.

Next objective is to verify we can communicate. We can do that in a few simple steps:

- View the webserver pod ip via `kubectl get po -o wide`
- Exec into the client pod via `kubectl exec -it task-1-client -- sh`
- Try to connect to the webserver via `wget <ip-of-webserver-pod>:80`


If the policies are incomplete or wrong, you will see that `wget` tries to connect and will eventually timeout:

```bash
/ # wget 10.224.0.12:80
Connecting to 10.224.0.12:80 (10.224.0.12:80)
wget: download timed out
```

If the policies are correct, you will see the following:

```bash
/ # wget 10.224.0.24:80
Connecting to 10.224.0.24:80 (10.224.0.24:80)
saving to 'index.html'
index.html           100% |***********************************************************************************************|   615  0:00:00 ETA
'index.html' saved
```

Don't forget to delete all pods and network policies via `kubectl delete po,netpol --all`.