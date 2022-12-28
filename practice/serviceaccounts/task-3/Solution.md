# Solution 

Make sure that the secret has the appropriate annotation (see `solution.yaml`).

Then deploy the resources `kubectl apply -f solution.yaml`. Verify that the secret is there and mounted by the pod - `kubectl get po task-3 -o yaml` and `kubectl get secret task-3 -o yaml`. Take a note of the token inside the secret. If that is okay, delete the pod via `kubectl delete pod task-3` and recreate it via `kubectl apply -f solution.yaml`.

Verify the that the token in the secret (`kubectl get secret task-3 -o yaml`) is still the same as above.