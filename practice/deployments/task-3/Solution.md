# Solution

Option 1:
Update the version inside the YAML and set it to `marcmer/demo-app:v2` and run `kubectl apply -f deploy.yaml`.

Option 2:
Run `kubectl set image deploy/task-1 *=marcmer/demo-app:v2` to update the image.

After updating the image, the deployment will start to rollout the new version. In the output of the monitor script you should can see how the version changes continuously to version 2.