.PHONY: prometheus_reload
prometheus_reload:
	docker-compose kill -s SIGHUP prometheus
	docker-compose logs --tail=20 prometheus

.PHONY: grafana_restart
grafana_restart:
	docker-compose restart grafana

.PHONY: caddy_adapt
caddy_adapt:
	docker-compose exec caddy caddy fmt -overwrite /etc/caddy/Caddyfile
	docker-compose exec caddy caddy adapt -config /etc/caddy/Caddyfile

.PHONY: blackbox_reload
blackbox_reload:
	docker-compose kill -s SIGHUP blackbox_exporter
	docker-compose logs --tail=20 blackbox_exporter
