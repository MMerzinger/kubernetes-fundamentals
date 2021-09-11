# Solution

Create the resources:
`kubectl apply -f .`

Check the output of the nginx:
`kubectl port-forward task-2-cm 8000:8000` and then access port 8000 on your localhost. You should see a text telling you that this website is coming from a ConfigMap.

__Hint: Please do not mount your website as a ConfigMap, this is just used as a simple example__