# Solution

Deploy the solution pod:
`kubectl apply -f pod-solution.yaml`

__Hint: If the pod already exists, then run `kubectl replace --force -f pod-solution.yaml`

Get pods with a specific label:
`kubectl get po -l tier=webserver`