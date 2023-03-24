# Solution

We use pod anti affinity with the `requiredDuringSchedulingIgnoredDuringExecution` mode. This means all conditions have to be matched during scheduling time.

If we look at our manifests, all pods have the `run: task-2` label and a seletor in their anti affinity spec:

```yaml
matchExpressions:
- labelSelector:
    matchExpressions:
    - key: run
      operator: In
      values:
      - task-2
  topologyKey: kubernetes.io/hostname
```

This means we enforce the distribution over the topology key `kubernetes.io/hostname` for all pods that have the label `run: task-2`. In our case we just have one node, but two pods. Hence the second pod will stay pending.