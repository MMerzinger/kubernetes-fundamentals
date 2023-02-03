# Task 3

Again for this task, all changes need to be done in `overlay/dev`. There are multiple solutions avaiable, I am going to show one that is completely done in `kustomization.yaml`.

There are  things to do:
1. Generate a configMap. We can extend `kustomization.yaml` with the following yaml to generate a configMap based on `config.yaml`:
```yaml
configMapGenerator:
  - name: config
    files:
      - config.yaml
```
Documentation to the configMapGenerator is available [here](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/configmapgenerator/#overriding-base-configmap-values). To test if your configMap is generated properly you can run `kubectl kustomize overlay/dev` and you should see that a configMap named `config-<SUFFIX>` is generated.

2. Patch the deployment with a new volume based on the configMap. This solution shows an inline approach with `kustomization.yaml`:
```yaml
patches:
  - patch: |-
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: task-3
      spec:
        template:
          spec:
            volumes:
              - name: config
                configMap:
                  name: config
            containers:
              - name: task-3
                volumeMounts:
                  - name: config
                    mountPath: /etc/app/config/
```

Now this is a bit more complex. In essence we add a volume called `config`, which uses a configMap, and a matching volumeMount to the deployment called `task-3` and to the container anmed `task-3`. It is important that those names match what is specified in the `base/` because this information is used by Kustomize to do the patch. Now if you add this section to `kustomization.yaml` and render it via `kubectl kustomize overlay/dev`.

You can find more details about the patch feature (and different patch approaches) [here in the docs](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/patches/).

Finally we can deploy via `kubectl apply -k overlay/dev`. Verify if the configMap was created via `kubectl get cm` and check if it was mounted properly via `kubectl get po -o yaml`.
