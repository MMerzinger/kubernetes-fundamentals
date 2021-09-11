# Solution

Create the resources:
`kubectl apply -f .`

Inspect the output of the pod:
`kubectl logs -f task-3-cm-env`

Change the contents of the ConfigMap key "EXAMPLE_KEY: example" to "EXAMPLE_KEY: updated" and update the ConfigMap with `kubectl apply -f configmap.yaml`. As you will see, the logs will not update and still display "The value of MY_VAR is example". This is because envrionment variables are loaded during startup and do not change if the contents of the ConfigMap change.