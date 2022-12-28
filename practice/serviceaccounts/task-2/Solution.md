# Solution 

Create the resources `kubectl apply -f solution.yaml`.

Look at the `automountServiceAccountToken` field on the service account and on the pod. To confuse you I set it to `true` on the pod, but left it open on the service account (that you can set it to `false`). If both are set, the `automountServiceAccountToken` on the pod is used. Hence, we need to set it to `false` on the pod.