# Solution

The Kubernetes Scheduler uses the CPU/Memory requests to calculate where to place a pod. It considers different factors such as the remaining capacity of a node. In our case we have a one node cluster and our pods require too much CPU/Memory. Therefore, the pods stay in a pending state as they cannot be scheduled to a node with sufficient resources.