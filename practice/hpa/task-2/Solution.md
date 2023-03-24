# Solution

In this scenario we are using version 2 of the HPA. This allows to specify the desired scaling behavior.

The goal was to scale 2 pods at once if the scaling condition is fulfilled. Ony the `hpa.yaml` in incomplete. You can find a solution in the `hpa-solution.yaml`.

The HPA spec allows to specify multiple scale policies. In our case we just need one. Below you can see the solution. It specifies that 2 pods are added to the deployment every 15 seconds until the metric is below the scale condition. 

```yaml
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 0
      policies:
      - type: Pods
        value: 2
        periodSeconds: 15
      selectPolicy: Max
```