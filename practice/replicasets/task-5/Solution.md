# Solution

You can update the image used by a ReplicaSet, but it won't do anything with it unless it scales and creates new pods. Then it uses the new image. Exising pods will stay the same as the ReplicaSet does not provide a way to update existing pods.