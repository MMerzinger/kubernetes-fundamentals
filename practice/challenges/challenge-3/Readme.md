# Task

Deploy the provided YAML with `kubectl apply -f challenge-3.yaml` - do not inspect the YAML.

Inspect the deployed pods. Some of them are in pending state:
- `kubectl describe po challenge-3`
- `kubectl get po challenge-3 -o yaml`

Why does Kubernetes refuse to run these pods?


Finally: Don’t forget to `kubectl delete -f challenge-3.yaml`
