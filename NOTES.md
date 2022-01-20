# DNS Names
We use flat DNS names. Everything goes through Caddy.

Thus the following return the same:
```
# from the host machine
curl http://node.prom.0-main.de/metrics
# inside the docker network
docker-compose exec curl curl http://node.prom.0-main.de/metrics
```

There can be conflicts on the `ingress` network. If there was another container
called `grafana` in another project, but also on the ingress network, then
Caddy (from here) would route to it. We use fully qualified domain
names to avoid collisions like that.


# Dump
- https://raw.githubusercontent.com/vegasbrianc/prometheus/master/docker-compose.yml
  via https://github.com/vegasbrianc/prometheus

```
rate(node_disk_reads_completed_total{device=~"md[0-9]+"}[5m])
rate(node_disk_writes_completed_total{device=~"md[0-9]+"}[5m])

avg by (instance) (irate(node_cpu_seconds_total{mode="iowait"}[1m])) * 100
```


# Loki Notes
Label things so that they are unique per system, because a stream must be in
increasing time order!
https://github.com/grafana/loki/blob/v1.5.0/docs/best-practices/current-best-practices.md#6-logs-must-be-in-increasing-time-order-per-stream

Logging can be done with the Docker plugin.
"The Loki logging driver still uses the json-log driver in combination with
sending logs to Loki. This is mainly useful to keep the docker logs command
working. You can adjust file size and rotation using the respective log option
max-size and max-file."
https://github.com/grafana/loki/blob/v1.5.0/docs/clients/docker-driver/configuration.md


# Blackbox Exporter
See [blackbox_exporter/](blackbox_exporter/README.md).

Note that modules are defined in [blackbox_exporter/blackbox.yml][] and used
in [prometheus/prometheus.yml][].


# Prometheus Delete
Note that `systemd_service_up` is a metric name
```
curl -X POST -g 'https://prometheus.prom.0-main.de/api/v1/admin/tsdb/delete_series?match[]=systemd_service_up'
```
