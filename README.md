# svc-a

Service A of the fictorg example, for [orca](https://github.com/adamkirk/orca).

- `orca ext os-info` runs a command in its container.
- `orca ext smoke` checks it answers through traefik. It also runs from the `up.post` hook.
- The workspace clones the sdk library inside it, at `vendor/sdk`, which is why `vendor/` is ignored.
