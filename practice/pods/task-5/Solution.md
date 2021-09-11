# Solution

`kubectl apply -f pod.yaml`

Forward the local port 8000 to the pod on port 80:
`kubectl port-forward task-5 8000:80`

Now access port 8000 on your localhost inside a browser. You should see the NGINX standard page.