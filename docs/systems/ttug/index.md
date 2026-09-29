# TTUG: ttug.net

Application for the Whispering Pines Trail and Taxiway Users Group committee.

## Features → components

| Feature | Component | API |
|---|---|---|
| Open the gate for an authorized user | `ttug-gate-service` (+ `gate-controller` resource) | `gate-api` |
| View financial documents | `ttug-documents-service` | `documents-api` |
| Meeting minutes and discussion | `ttug-minutes-service` + `comments-service` | `minutes-api`, `comments-api` |
| Budget planning | `ttug-budget-service` (+ `reports-service`) | `budget-api` |
| Historical documentation | `ttug-documents-service` | `documents-api` |
| Communication | `notifications-service`, `events-service` | `notifications-api`, `events-api` |

## Roles (draft)

| Role | Gate | Financials | Minutes | Budget |
|---|---|---|---|---|
| Resident | open | view | view | view |
| Committee member | open | view | edit | edit |
| Chair / admin | open, manage users | manage | manage | manage |

## Gate: questions to answer before development

- [ ] How does the controller accept commands today (relay, keypad bus, vendor cloud API)?
- [ ] What happens if the network, the cluster or the IdP is down? The gate must fail to a safe, usable state.
- [ ] Audit log: who opened it, when, from where; retention period?
- [ ] Rate limiting and anti-replay; is geofencing or a confirmation step wanted?
- [ ] Guest/temporary access (vendors, fly-in visitors)?
- [ ] Who can revoke access, and how fast does it take effect?

## Ideas & decisions

- [Ideas](ideas/README.md)
- [Decisions](decisions/README.md)
