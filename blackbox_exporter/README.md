https://github.com/prometheus/blackbox_exporter

https://medium.com/the-telegraph-engineering/how-prometheus-and-the-blackbox-exporter-makes-monitoring-microservice-endpoints-easy-and-free-of-a986078912ee

debug probe via `&debug=true`, e.g.:
```
http://blackbox.moni.0-main.de/probe?target=prometheus.io&module=http_any&debug=true
```

reload:
```
dc kill -s SIGHUP blackbox_exporter
```

Note that the blackbox module is defined in [blackbox.yml](./blackbox.yml).
