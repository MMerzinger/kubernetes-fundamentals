# Solution

Create the resources:
`kubectl apply -f .`

Inspect the output of the pod:
`kubectl logs -f task-4-secret-volume`

Change the contents of the Secret key "SECRET_KEY: dG9wX3NlY3JldAo=" to " SECRET_KEY: aGVsbG8K" and update the secret with `kubectl apply -f secret.yaml`. As you will see, the logs will change after some time from "top_secret" to "hello". This is because the secret is mounted as a volume. If the value of a volume comes from a secret or config map, then updates of the secret/configmap will be reflected by the volume after some time.