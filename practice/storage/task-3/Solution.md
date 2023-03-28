# Solution

You can find the complete solution in `pvc-solution.yaml`, the `pod.yaml` is already complete.

First task - fill out the missing fields. Specifying the required storage is the same as with task-2, hence we just add the YAML in the `pvc.yaml`:

```yaml
  resources:
    requests:
      storage: 100M
```

Next we need to find available storage. Storage is "offered" through StorageClasses. We can have a look at them through the following command:

```bash
kubectl get sc
NAME                    PROVISIONER          RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
azurefile               file.csi.azure.com   Delete          Immediate              true                   30m
azurefile-csi           file.csi.azure.com   Delete          Immediate              true                   30m
azurefile-csi-premium   file.csi.azure.com   Delete          Immediate              true                   30m
azurefile-premium       file.csi.azure.com   Delete          Immediate              true                   30m
default (default)       disk.csi.azure.com   Delete          WaitForFirstConsumer   true                   30m
managed                 disk.csi.azure.com   Delete          WaitForFirstConsumer   true                   30m
managed-csi             disk.csi.azure.com   Delete          WaitForFirstConsumer   true                   30m
managed-csi-premium     disk.csi.azure.com   Delete          WaitForFirstConsumer   true                   30m
managed-premium         disk.csi.azure.com   Delete          WaitForFirstConsumer   true                   30m
```

Quite a few storage classes. If you want to learn more about the details of them, check out the [AKS docs](https://learn.microsoft.com/en-us/azure/aks/concepts-storage).

In our case we need to use a cheap storage, therefore we use the `managed-csi` storage class that uses standard SSD disks.

To use the storage class we need to extend the `pvc.yaml`:

```yaml
  storageClassName: managed-csi
```

All manifests complete - now create the resources via `kubectl apply -f pvc.yaml -f pod.yaml`. Shortly after both should come up:

```bash
kubectl get po,pvc
NAME         READY   STATUS    RESTARTS   AGE
pod/task-3   1/1     Running   0          27s

NAME                           STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/task-3   Bound    pvc-54f268b6-b4be-42b9-99a7-453830368dd8   1Gi        RWO            managed-csi    27s
```