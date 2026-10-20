#!/bin/sh
# Checks svc-a answers through traefik, over TLS. It resolves the host itself,
# so it works without adding it to /etc/hosts. Traefik can take a moment to
# pick a new container up, so it tries a few times.
port="${HTTPS_PORT:-28443}"

for _ in 1 2 3 4 5 6 7 8 9 10; do
  if body=$(curl -sfk --resolve "svc-a.orca-fictorg.test:$port:127.0.0.1" "https://svc-a.orca-fictorg.test:$port/"); then
    echo "svc-a answered: $body"
    exit 0
  fi

  sleep 1
done

echo "svc-a didn't answer on https://svc-a.orca-fictorg.test:$port/" >&2
exit 1
