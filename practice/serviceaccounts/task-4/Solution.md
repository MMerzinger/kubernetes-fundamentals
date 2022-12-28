# Solution 

Apply the resources `kubectl apply -f sa.yaml` and `kubectl apply -f pod.yaml`.

Print the bearer token from the pod via `kubectl exec -it task-4 -- cat /var/run/secrets/kubernetes.io/serviceaccount/token`.

The `Readme.md` describes how to access the API server from your local machine, therefore, this solution will show the second way, by using curl from the pod. Therefore, you need to execute the following:
`kubectl exec -it task-4 -- curl -H "Authorization: Bearer <PASTE-THE-TOKEN>" -v -k https://kubernetes:443/api/v1/namespaces/default/pods`. The response should look like this:
```bash
...
<
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "pods is forbidden: User \"system:anonymous\" cannot list resource \"pods\" in API group \"\" in the namespace \"default\"",
  "reason": "Forbidden",
  "details": {
    "kind": "pods"
  },
  "code": 403
* Connection #0 to host kubernetes left intact
}%
```

This clearly indicates that we can communicate with the API server, but we are not authorized to list pods.

Now delete the pod via `kubectl delete po task-4` and create it again `kubectl apply -f pod.yaml`. If we try our request again, without refreshing the token: `kubectl exec -it task-4 -- curl -H "Authorization: Bearer <PASTE-THE-TOKEN>" -v -k https://kubernetes:443/api/v1/namespaces/default/pods` the answer will look like this:
```bash
<
{
  "kind": "Status",
  "apiVersion": "v1",
  "metadata": {},
  "status": "Failure",
  "message": "Unauthorized",
  "reason": "Unauthorized",
  "code": 401
* Connection #0 to host kubernetes left intact
}
```

The response code is now a 401, which indicates that our token is invalid. 

We have seen that using a token after the deletion of the pod does not work. In summary short-lived tokens work :)
