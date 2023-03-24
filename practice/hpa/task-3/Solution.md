# Solution

This a bit of a special case, as all the tools like Helm and co. will cover it for you.

When we create the provided manifests via `kubectl apply -f task-3/` it will take a moment until the HPA scales the deployment. If we do a `kubectl apply -f task-3/` again, the deployment will fall back to 1 replica, just that the HPA can scale it up a few seconds later. This must be avoided.

To do so remove the `replicas` field of the deployment manifest. Then deploy them with `kubectl apply -f deploy-solution.yaml -f hpa.yaml -f load-generator.yaml --field-manager=handover-to-hpa`. It might take a moment again, but then you can continue to update the manifests and apply them with the `--field-manager=handover-to-hpa` flag. This tells Kubernetes to consider the deployment managed by the hpa, without setting the replicas to 1.