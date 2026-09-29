# Platform

Shared services every site can use. Sites should never talk to Slack, Twitter, SMTP or SMS
providers directly. They call `notifications-api`, and the notifications service picks the
channel from the user's preferences.

## Service layers

| Layer | Components |
|---|---|
| Identity | `identity-provider` (OIDC), `users-service` (profiles, roles, site memberships) |
| Collaboration | `events-service`, `comments-service`, `messaging-service` |
| Delivery | `notifications-service` → `notify-email`, `notify-sms`, `notify-slack`, `notify-twitter`; `realtime-gateway` (WebSocket) |
| Data | `weather-service`, `reports-service` |

## Open questions

- [ ] Is "Messaging" user-to-user conversations (modeled here as `messaging-service`), outbound notifications (`notifications-service`), or both?
- [ ] One Postgres with a schema per service, or a database per service?
- [ ] Service-to-service auth: OIDC client credentials, mTLS, or both?
- [ ] Shared Go/Java/Python client libraries generated from the OpenAPI specs?

## Ideas & decisions

- [Ideas](ideas/README.md)
- [Decisions](decisions/README.md)
