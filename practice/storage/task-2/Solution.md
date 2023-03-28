# Solution

The missing fields are marked with a `?`. You can find the complete solution in `pod-solution.yaml` and `pvc-solution.yaml`.

First we need to reference the PVC from our pod. Therefore, we need to tell the volume which PVC shall be used:

```yaml
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: task-2
```

Now that the pod knows which PVC to mount, we need to complete the PVC spec. As required by the task, we need to setup a PVC with `50M` storage. This can be specified in the `pvc.yaml` as follows:

```yaml
  resources:
    requests:
      storage: 50M
```

Hint: To see how the API is structured, you can use `kubectl explain pvc.spec.resources`.

Now that our manifests are complete, we can go on and create them via `kubectl apply -f pvc.yaml -f pod.yaml`.

Check the date written by the container to the PVC via `kubectl exec -it task-2 -- cat /data/history`. You should see one date.

Lets see what happens if we recreate the pod. Use `kubectl replace --force -f pod.yaml` to recreate it.

After we have recreated our pod, we can see the following ouptut:

```bash
kubectl exec -it task-2 -- cat /data/history
Pod started on Tue Mar 28 06:45:08 UTC 2023
Pod started on Tue Mar 28 06:46:12 UTC 2023
```

We can see two dates, hence our data is persisted across pod restarts.

Hint: Can you think of a reason why our PVC has `1Gi` as capacity and not `50M` as specified?