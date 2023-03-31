# Solution

This task is very similar to task-1, i.e. we have a client and a webserver. The client should connect to the webserver via port 80. Now our network policies are complete, but quite different.

Short solution: Our network policies still allow the traffic between client and webserver, but in a bigger extend. Hence, our policies allow more than what is required.

All differences step by step:

## No `port` section

Both network policies, for client and webserver, do not contain a `port` section like this:

```yaml
    ports:
    - protocol: TCP
      port: 80
```

When looking at the spec via `kubectl explain netpol.spec.ingress.ports` we get the following explanation:

```bash
kubectl explain netpol.spec.ingress.ports
KIND:     NetworkPolicy
VERSION:  networking.k8s.io/v1

RESOURCE: ports <[]Object>

DESCRIPTION:
     List of ports which should be made accessible on the pods selected for this
     rule. Each item in this list is combined using a logical OR. If this field
     is empty or missing, this rule matches all ports (traffic not restricted by
     port). If this field is present and contains at least one item, then this
     rule allows traffic only if the traffic matches at least one port in the
     list.
...
```

In simple words: It matches all ports if nothing is specified.

## Multiple selectors for the client egress network policy

The network policy for the client has the following selectors for the pods that the client will connect to:

```yaml
  policyTypes:
  - Egress
  egress:
  - to:
    - namespaceSelector:
        matchLabels:
          namespace: demo
    - podSelector:
        matchLabels:
          app.kubernetes.io/name: webserver
```

Again, we can ask the spec on how to interpret these fields via:

```bash
kubectl explain netpol.spec.egress.to
KIND:     NetworkPolicy
VERSION:  networking.k8s.io/v1

RESOURCE: to <[]Object>

DESCRIPTION:
     List of destinations for outgoing traffic of pods selected for this rule.
     Items in this list are combined using a logical OR operation. If this field
     is empty or missing, this rule matches all destinations (traffic not
     restricted by destination). If this field is present and contains at least
     one item, this rule allows traffic only if the traffic matches at least one
     item in the to list.
...
```

Selectors will be combined with an OR. Hence, we allow egress traffic to pods in the same namespace with the label `app.kubernetes.io/name: webserver` but also to pods in namespaces with the label `namespace: demo`.

HINT: `namespace: demo` is a label, not the namespace demo.

## Using a ipBlock in the `from` section

The network policy for the webserver uses a very open selector for incoming traffic:

```yaml
  ingress:
  - from:
    - ipBlock:
        cidr: 0.0.0.0/0
```

By specifying a `cidr` block with `0.0.0.0/0` we allow incoming traffic from basically all available IPs. This is very open and should be avoided.

Don't forget to delete all pods and network policies via `kubectl delete po,netpol --all`.