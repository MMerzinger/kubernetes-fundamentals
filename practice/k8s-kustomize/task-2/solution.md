# Task 2

The changes we need to implement are centered around the `dev` overlay. Therefore, we need to edit `overlay/dev/kustomization.yaml`.

To add common labels, we can use the `commonLabels` section: 

```yaml
commonLabels:
  env: dev
```

You can find more details on the common labels feature [here](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/commonlabels/).

Next we need to add a name suffix. This can be done through the `nameSuffix` field:
```yaml
nameSuffix: -dev
```

Now Kustomize will add a "-dev" suffix to all resources of this overlay.

You can find more details on the name suffix feature [here](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/namesuffix/).

Now we can render `overlay/dev` via `kubectl kustomize overlay/dev` and apply it via `kubectl apply -k overlay/dev`.

You should now have one deployment called task-2 with one replica. You can verify the suffix via `kubectl get deploy` and the labels via `kubectl get po,deploy --show-labels`.