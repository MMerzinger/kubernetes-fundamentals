# Solution

Create the resources:
`kubectl apply -f .`

Take a note of the public IP (External IP) and execute  `curl <IP>:8080` (you may use your browser, but take care to do a full refresh):
`kubectl get svc`

The output toggles as the service selects both versions (deploy1 and deploy2) as these use a common set of labels. To overcome this, you might want to update the selector of the service to specifically select a version.