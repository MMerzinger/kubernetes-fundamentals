# Task 4

In this task we need to add a new environment "test" and configure it. Therefore, we have to implement the following steps:
1. Create a new overlay, e.g. `mkdir overlay/test`
2. Create a `kustomization.yaml` in `overlay/test`. It should have the following content for now:
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - ../../base/
```
3. We want to change the image tag. This can be done by adding the following section to the `kustomization.yaml` file:
```yaml
images:
  - name: nginx
    newTag: "1.19"
```
This will update the tag to `1.19` for containers with the image `nginx`. You can find more details in the [docs](https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/images/) on how to update images and tags. You can verify the output via `kubectl kustomize overlay/test`.
4. Next we want to change the replicas. Quite handy that there is a `replicas` field:
```yaml
replicas:
- name: task-4
  count: 3
```
Verify the output via `kubectl kustomize overlay/test`. The replicas of deployment `task-4` were now set to 3.
5. We are almost there, we just need to create a namespace. Therefore, we add a file `namespace.yaml` in `overlay/test` and add the required content of a namespace yaml. Next we need to tell Kustomize to use this file, therfore, we extend the `kustomization.yaml` in `overlay/test` with the following content:
```yaml
resources:
  - namespace.yaml
  - ../../base/
```

Finally we can deploy via `kubectl apply -n -k overlay/test`. Verify if the configMap was created via `kubectl get cm` and check if it was mounted properly via `kubectl get po -o yaml`.

__Important note__: There are lots of ways in achieving the same result with Kustomize. But: There are different implications. Goal of these tasks were to show you different ways of using and structuring your kustomization code.
