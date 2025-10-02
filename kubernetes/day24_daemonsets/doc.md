# Day 24 — DaemonSets (doc)

## What is a DaemonSet?
A DaemonSet ensures that a copy of a Pod runs on selected nodes in the cluster (usually every node). It's used for cluster-wide agents such as monitoring, logging, or networking.

## Key fields in the YAML
- `kind: DaemonSet` — object type.
- `spec.selector.matchLabels` — label selector matching the Pod template.
- `spec.updateStrategy` — RollingUpdate or OnDelete. RollingUpdate supports `maxUnavailable`.
- `spec.template.spec` — pod template (containers, volumes, node selectors, tolerations).

## Important behaviors
- When nodes are added, DaemonSet automatically schedules pods on them.
- When nodes are removed, pods are removed.
- You don't control Pod count via replicas — it equals node count (subject to nodeSelector/tolerations).

## Demo items included
1. `daemonset-nginx.yaml` — minimal DaemonSet (learn how it schedules 1 pod per node).
2. `daemonset-node-exporter.yaml` — real-world: how to run a node exporter (host mounts, hostNetwork, hostPID).

## How updates work
- To update image/version, edit the DaemonSet (e.g. change image tag). If `updateStrategy` is `RollingUpdate`, the update is rolled per node.
