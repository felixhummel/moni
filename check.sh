#!/bin/bash
set -euo pipefail

PS4=$'🞂 '
set -x
curl -fsIo /dev/null http://node.prom.0-main.de/metrics
curl -fsIo /dev/null http://grafana.prom.0-main.de/
curl -fso /dev/null http://loki.prom.0-main.de/ready
