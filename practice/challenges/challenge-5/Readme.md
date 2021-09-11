# Task

Deploy the provided YAML with `kubectl apply –f challenge-5.yaml` – do not inspect the YAML.

Inspect the deployed resources. Figure out which public IP address is used for the load balancer and access it. Why do you get no response?:
- `kubectl describe svc <name>`
- `kubectl get svc <name> –o yaml`
- `kubectl get deploy challenge-5 --show-labels`

How do you fix this issue?

Hint: The response should simply be "Version 1"


Finally: Don’t forget to `kubectl delete –f challenge-5.yaml`
