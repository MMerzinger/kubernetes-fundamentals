# Access the Kubernetes API server 

First, apply the resources via `kubectl apply -f sa.yaml` and `kubectl apply -f pod.yaml`.

Next, check if and where the token is mounted via `kubectl get po task-4 -o yaml`.

Now we can try to access the API server. To do so we need the token, you can obtain it in different ways, e.g. `kubectl exec -it task-4 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token`.

With this token we can send a request to the API server. You can either do this inside a pod or from your local machine. If you do it from your local machine, you need to obtain the IP/domain of your API server: `kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}'`. With that you can send a request: `curl -v -k -H "Authorization: Bearer <your-token>" https://<your-api-server>:<port>/api/v1/namespaces/default/pods`. If you are using PowerShell: `Invoke-WebRequest -SkipCertificateCheck -Authentication Bearer -Token (Read-Host -AsSecureString) -Uri https://<your-api-server>:<port>/api/v1/namespaces/default/pods` and then paste the content of the token.
