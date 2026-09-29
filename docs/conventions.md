# Conventions

## Entity kinds

| Kind | Use for | Examples |
|---|---|---|
| `System` | A site or product area; groups everything below | `ttug`, `areasontofly`, `platform`, `infrastructure` |
| `Component` | Something you deploy. `spec.type`: `website`, `service`, `adapter`, `job`, `library` | `ttug-gate-service`, `n42bm-web` |
| `API` | A contract a component provides. `spec.type`: `openapi`, `asyncapi`, `grpc`, `graphql` | `gate-api`, `oidc` |
| `Resource` | Something you run on or rent: cluster, DB, device, third-party account, DNS zone | `k3s-pi-cluster`, `gate-controller`, `dns-ttug-net` |
| `User` | People who own things | `brian` |

## Lifecycle (`spec.lifecycle` on Components and APIs)

| Value | Meaning | Exit criteria |
|---|---|---|
| `idea` | Worth remembering; nothing committed | A one-paragraph idea doc exists |
| `design` | Actively deciding what/how | Key ADRs accepted, API sketched |
| `development` | Code being written | Repo exists, builds in CI |
| `testing` | Deployed somewhere non-public, being exercised | Meets acceptance checklist |
| `deployed` | Live and relied on | — |
| `deprecated` | Still running, being replaced | Replacement deployed |
| `retired` | Gone; kept for history | — |

## Naming

- lowercase kebab-case; file name == `metadata.name`
- websites: `<system>-web`; services: `<noun>-service`; channel adapters: `notify-<channel>`
- DNS zones: `dns-<domain-with-dashes>` (e.g. `dns-ttug-net`)
- references need an explicit kind in `dependsOn` (`component:…`, `resource:…`); API refs don't

## Custom annotations (`brianmichael.org/…`)

Use `tbd` when unknown. The dashboard counts open `tbd`s so you can see what's undecided.

| Applies to | Annotation | Values |
|---|---|---|
| Component | `language` | `go`, `java`, `python`, `typescript`, `static`, `off-the-shelf`, … |
| Component | `runtime` | `k3s`, `github-pages`, `managed:<vendor>`, … |
| Component | `repo` | `github.com/<org>/<repo>` |
| Component | `priority` | `P0`–`P3`, or a score if you use weighted scoring |
| DNS zone | `domain`, `registrar`, `dns-host`, `tls`, `redirects-to`, `serves`, `renewal` | free text; `renewal` as `YYYY-MM-DD` |
| Resource | `location`, `interface` | free text |

## Adding a field

1. Add the annotation to the YAML files.
2. If it should be required, add it to `REQUIRED_COMPONENT_ANNOTATIONS` in `scripts/build_catalog.py`.
3. If it should appear on the dashboard, add a column in `render_dashboard()`.
