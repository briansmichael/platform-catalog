# Infrastructure

Where things run and what they rent.

| Resource | Notes |
|---|---|
| `k3s-pi-cluster` | 16-node Raspberry Pi cluster, k3s |
| `postgres`, `object-storage` | Planned shared data stores |
| `github-pages` | Static hosting (n42bm.com today) |
| `proton-mail` | cajunbug.net mail (MX only, no website) |
| `*-provider`, `aviationweather-gov` | Third-party accounts and APIs |

## Open questions

- [ ] Ingress and TLS: Traefik (k3s default) + cert-manager with Let's Encrypt DNS-01?
- [ ] How is the home cluster exposed: Cloudflare Tunnel, port-forward + DDNS, or a VPS edge?
- [ ] Backups for Postgres and object storage: where, and how often?
- [ ] GitOps (Flux or Argo CD) from a deployments repo?

## Ideas & decisions

- [Ideas](ideas/README.md)
- [Decisions](decisions/README.md)
