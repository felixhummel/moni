Get default config
```
docker run -d --name loki-default grafana/loki:2.4.1
docker cp loki-default:/etc/loki/local-config.yaml config.yaml
docker rm -f loki-default
```
