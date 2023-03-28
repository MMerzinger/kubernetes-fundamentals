# Solution

First we need to create the resources via `kubectl apply -f pvc.yaml -f pod.yaml`.

The task description already indicates that there is a problem with the resources. Therefore, inspect them:

```bash
kubectl get po,pvc
NAME         READY   STATUS    RESTARTS   AGE
pod/task-4   0/1     Pending   0          68s

NAME                           STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS   AGE
persistentvolumeclaim/task-4   Pending                                      managed        68s
```

We can see that our PVC is in `Pending` status. This indicates that there is an issue with fulfilling the PVCs requirements.

Lets check that in detail with `kubectl describe pvc task-4` or `kubectl get pvc task-4 -o yaml`.

Besides other output the commands yield the following:

```bash
  Warning  ProvisioningFailed    29s (x8 over 2m36s)  disk.csi.azure.com_csi-azuredisk-controller-9d4d96b8c-jxct7_87980505-f941-49a5-bc8b-19ee5f701eb3  failed to provision volume with StorageClass "managed": rpc error: code = InvalidArgument desc = Volume capability not supported
  Normal   ExternalProvisioning  3s (x12 over 2m36s)  persistentvolume-controller                                                                       waiting for a volume to be created, either by external provisioner "disk.csi.azure.com" or manually created by system administrator
```

`Volume capability not supported` indicates that our storage class does not cover the requirements that we specified in our PVC.

If we compare what type of storage is available through the storage class (see [here](https://learn.microsoft.com/en-us/azure/aks/concepts-storage)), we can see that it is block storage in form of a ssd disk. In our PVC we specify the access mode `ReadWriteMany` - this is typically not supported by a disk as it cannot be attached to multiple nodes in parallel.

Bonus: Try to change the access mode to `ReadWriteOnce` and make sure the pod starts.
