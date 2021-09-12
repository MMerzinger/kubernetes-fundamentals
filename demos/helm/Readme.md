# Helm Chart Demo

Install chart via:
`helm install --namespace demo --create-namespace demo ./demo`

Inspect the chart:
`helm ls`

Inspect the installed app:
`kubectl get all -n demo`

Uninstall chart:
`helm uninstall demo -n demo`