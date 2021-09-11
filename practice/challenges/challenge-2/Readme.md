# Task

Deploy the provided YAML with `kubectl apply –f challenge-2.yaml` – do not inspect the YAML.

Inspect the pod challenge-2 and debug why it is not starting properly:
- `kubectl describe po challenge-2`
- `kubectl get po challenge-2 –o yaml`



Finally: Don’t forget to `kubectl delete –f challenge-2.yaml`
