# Prometheus Grafana Stack
By default this runs at the domain `prom.0-main.de` [^0-main.de] exposing ...

- [Grafana Dashboard](https://grafana.prom.0-main.de/dashboards)
- [Prometheus UI](https://prometheus.prom.0-main.de/targets)
- [node exporter metrics](https://node.prom.0-main.de/metrics)
- [cadvisor metrics](https://cadvisor.prom.0-main.de/metrics)
- [blackbox HTTP ping
  metrics](https://blackbox.prom.0-main.de/probe?module=http_any&target=https://hukudo.de)
- [loki](https://loki.prom.0-main.de/ready)
- [pushgateway](https://pushgateway.prom.0-main.de/)

[^0-main.de]: Our domain `0-main.de` points to localhost (see
              https://blog.hukudo.de/infra/0-main.html for more information)

Please note that all of these are also exposed via plain HTTP without TLS to
make scraping easier, because you get to see the same endpoints as prometheus
does. However you should disable this in security-sensitive contexts.

## Usage
To use it as is, make sure that you have our [ingress][] installed and running 
at version [2022-01.1](https://gitlab.com/hukudo/ingress/-/tags/2022-01.1) or
greater.
```
cat <<'EOF' > .env
GF_SECURITY_ADMIN_PASSWORD=changeme
EOF

docker-compose up -d --build --remove-orphans
dig prom.0-main.de +short
```

[ingress]: https://gitlab.com/hukudo/ingress


# Using another Domain
Replace `prom.0-main.de` with your TLD, e.g.:
```
rg -l 'prom\.0-main.de' | rg -v README.md \
  | xargs -L1 sed -i -e 's/prom\.0-main.de/example.com/'
```

We deliberately kept the many duplicates of fully qualified domain names to
keep readability high and aid debugging (think copy&paste).


# Development
```
vi prometheus/prometheus.yml
make prometheus_reload

vi grafana/provisioning/
make grafana_restart

vi caddy/Caddyfile
make caddy_adapt
```
