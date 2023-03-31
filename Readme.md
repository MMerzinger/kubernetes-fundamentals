# Accompanying exercises for the Kubernetes Fundamentals course

[![Gitpod open-workspace](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/MMerzinger/kubernetes-fundamentals)

This repository contains the accompanying practice tasks for the Kubernetes Fundamentals course. 

To follow along the practice tasks, please make sure to setup `kubectl` as explained in the initial mail using one of those two options:
1. Install `kubectl` locally using the [docs](https://kubernetes.io/docs/tasks/tools/)
2. Register and start [Gitpod](https://gitpod.io/#https://github.com/MMerzinger/kubernetes-fundamentals)

## A note about PowerShell

Commands found in this repo were tested with PowerShell Core. You may have PowerShell Version 5 installed locally, which you can check with `$PSVersionTable`. In this case some commands, especially `curl`/`Invoke-WebRequest` behave quite different than `bash` or PowerShell Core. You may need to use wrapper such as `(Invoke-WebRequest <URL>).Content`.

## Structure

The following output of `tree -L 2` shows the folder structure of this repo:

```bash
.
├── Cheatsheet.md
├── LICENSE
├── Readme.md
├── demos --> Used for demos
│   ├── apps
│   ├── helm
│   └── ingress
├── examples --> Used for examples in slides 
│   ├── cicd
│   ├── deployments
│   ├── docker
│   ├── hpa
│   ├── kustomize
│   ├── namespaces
│   ├── network
│   ├── networkpolicies
│   ├── pods
│   ├── psp
│   ├── rbac
│   └── serviceaccounts
└── practice -> Your practice tasks
    ├── challenges
    ├── configuration
    ├── deployments
    ├── hpa
    ├── ingress
    ├── k8s-kustomize
    ├── namespaces
    ├── network
    ├── networkpolicies
    ├── pods
    ├── pods2
    ├── replicasets
    ├── scheduling
    ├── serviceaccounts
    └── storage
```

## License

MIT: https://marcm.mit-license.org
