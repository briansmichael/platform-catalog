# platform-catalog

Single source of truth for Brian's websites, the webservices behind them, and the
infrastructure they run on: **what exists, what it does, what state it's in, what it
depends on, and what ideas and decisions surround it.**

```
catalog/            ← the data: one YAML file per entity (Backstage entity format)
  systems/            a site or product area (TTUG, A Reason to Fly, Platform, …)
  components/         deployable things: websites, services, adapters
  apis/               contracts components provide / consume
  resources/          things you run on or buy: k3s cluster, Postgres, gate controller, providers
  dns/                one file per domain name (registrar, DNS host, TLS, redirects)
  users/
docs/               ← the words: rendered by MkDocs Material
  catalog/            GENERATED dashboard + dependency graphs (don't hand-edit)
  systems/<system>/   overview, ideas/, decisions/ (ADRs) for each system
  templates/          ADR, idea and component templates
scripts/build_catalog.py   validates references + regenerates dashboard & catalog-info.yaml
catalog-info.yaml   GENERATED Backstage Location listing every entity file
```

## Quick start

```bash
python -m venv .venv && . .venv/bin/activate
pip install -r requirements.txt
make catalog     # validate + regenerate dashboard
make serve       # http://127.0.0.1:8000
```

## Daily workflow

| I want to…                        | Do this |
|-----------------------------------|---------|
| Change a status                   | Edit `spec.lifecycle` in the component/API YAML, `make catalog`, commit |
| Add a service                     | Copy `docs/templates/component.yaml` into `catalog/components/<name>.yaml`, fill it in, `make catalog` |
| Capture a quick idea              | Open a GitHub Discussion in the system's category (see `.github/DISCUSSION_TEMPLATE/`) |
| Flesh out an idea                 | Copy `docs/templates/idea.md` → `docs/systems/<system>/ideas/` |
| Commit to building it             | Convert the Discussion to an Issue; it lands on the GitHub Project board |
| Record a design choice            | Copy `docs/templates/adr.md` → `docs/systems/<system>/decisions/NNNN-title.md` |
| See everything at once            | `docs/catalog/index.md` (dashboard) and `graphs.md` (dependency graphs) |

See [`docs/conventions.md`](docs/conventions.md) for the lifecycle definitions, naming
rules and custom annotations.

## Later: full Backstage

Every YAML file is valid Backstage. If you stand up Backstage on the k3s cluster, register
this repo's `catalog-info.yaml` as a Location and the whole catalog appears, relationships
included. Nothing here needs to change.
