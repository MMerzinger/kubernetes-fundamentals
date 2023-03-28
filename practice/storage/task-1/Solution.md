# Solution

The missing fields are marked with a `?`. You can find the complete solution in `pod-solution.yaml`.

To create an `emptyDir` volume, we can simply extend the `volumes` section as follows:

```yaml
  volumes:
  - name: data
    emptyDir: {}
```

A `{}` is am empty dictionary in YAML. Hence, we rely on the default configuration for `emptyDir`. For example we use the default medium configured in the cluster, which can be `memory` or `disk`.

Next we need to mount the volume. To do so we need to extend the `volumeMounts` section of the container:

```yaml
    volumeMounts:
    - name: data
      mountPath: /data
```

Under `mountPath` we can specify the path in the file system of the container, where Kubernetes should mount the volume we specified with `name`.

Now create all resources with `kubectl apply -f pod.yaml`.

Lets see what is stored in the `emptyDir`. By looking at the `command` and `args` section we can see that a date is logged into `/data/history`, which is on our volume.

To see what is inside the file, you can use `kubectl exec -it task-1 -- cat /data/history`.

Lets see what happens if we recreate the pod. To do so run `kubectl replace --force -f pod.yaml` - this will delete and create the pod.

If we run `kubectl exec -it task-1 -- cat /data/history` again, we will see a new date - this is because we deleted the pod - hence removing the data in the `emptyDir`.