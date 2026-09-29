# GitHub Project setup (one time, ~5 minutes)

Create a Project (table layout) named **Platform** and link it to this repo.

Custom fields, which mirror the catalog so the board and YAML agree:

| Field | Type | Options |
|---|---|---|
| Status | single select | idea, design, development, testing, deployed, deprecated, retired |
| System | single select | platform, ttug, areasontofly, n42bm, brianmichael, n5448p, starfireaviation, infrastructure |
| Kind | single select | website, service, adapter, api, resource, dns, docs |
| Language | single select | go, java, python, typescript, static, off-the-shelf |
| Runtime | single select | k3s, github-pages, managed |
| Priority | single select or number | P0–P3, or a weighted score |
| Component | text | metadata.name |

Useful saved views:

- **All work**: table, grouped by System, sorted by Priority
- **Pipeline**: board, columns = Status
- **Undecided**: table filtered to Status = idea or design

Discussions: enable them on the repo and create one category per system
(the `ideas` template above attaches to a category named `Ideas`; add a
per-system category if you prefer separate streams).
