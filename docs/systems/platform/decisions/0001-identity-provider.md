# 0001: Identity provider

- **Status:** proposed
- **Date:** 2026-09-29
- **Affects:** `identity-provider`, every component that consumes `oidc`

## Context
Every site needs login, and TTUG needs role-based authorization strong enough to open a
physical gate. Services will be written in Go, Java and Python, so identity must be
language-neutral (OIDC/JWT). It will run on arm64 k3s nodes.

## Options considered
| Option | Pros | Cons | Pi/k3s fit |
|---|---|---|---|
| Authentik | Friendly admin UI, flows, built-in MFA/WebAuthn, proxy outpost | Python + Postgres + Redis | Good, arm64 images |
| Keycloak | Industry standard, very complete | JVM, heavier memory | OK on 8 GB nodes |
| Zitadel | Single Go binary, multi-tenant | Smaller community | Very good |
| Roll my own | Full control | Security risk, large effort | n/a |

## Decision
_Not yet made._

## Consequences
_TBD._
