# Accompanying exercises for the Kubernetes Fundamentals course

[![Gitpod open-workspace](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/MMerzinger/kubernetes-fundamentals)

This repository contains the accompanying practice tasks for the Kubernetes Fundamentals course. 

To follow along the practice tasks, please make sure to setup `kubectl` as explained in the initial mail using one of those two options:
1. Install `kubectl` locally using the [docs](https://kubernetes.io/docs/tasks/tools/)
2. Register and start [Gitpod](https://gitpod.io/#https://github.com/MMerzinger/kubernetes-fundamentals)

## Structure

The following output of `tree -L 2` shows the folder structure of this repo:

```bash
.
├── LICENSE
├── Readme.md
├── demos  --> Used for demos
│   ├── apps
│   └── ingress
├── examples --> Used for examples in slides 
│   ├── deployments
│   ├── network
│   └── pods
└── practice --> Your practice tasks
    ├── challenges
    ├── configuration
    ├── deployments
    ├── ingress
    ├── network
    ├── pods
    ├── pods2
    └── replicasets
```

## License

MIT: https://marcm.mit-license.org
