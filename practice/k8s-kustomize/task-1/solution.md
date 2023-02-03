# Task 1

You need to set the `kind` of `base/kustomization.yaml` to `kind: Kustomization`.

Next we need to reference from the `overlay/dev/kustomization.yaml` the base by adding a resources like this:
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../../base/
```

Now we can render `overlay/dev` via `kubectl kustomize overlay/dev` and apply it via `kubectl apply -k overlay/dev`.

You should now have one deployment called task-1 with one replica.