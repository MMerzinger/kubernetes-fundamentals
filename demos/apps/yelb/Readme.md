# Yelb Demo App

This app is used to demonstrate a complete Kubernetes application. It is based on [Yelb](https://github.com/mreferre/yelb). Yelb was published under the [Apache 2.0 license](https://github.com/mreferre/yelb/blob/master/LICENSE).


## Changes

The following changes were implemented on the `yelb-k8s-loadbalancer.yaml` file:
1. Replaced the Docker Hub images with a dedicated Azure Container Registry.
2. Images were replicated without changes into the Azure Container Registry.

