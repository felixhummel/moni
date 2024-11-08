#!/bin/bash
set -euo pipefail

PS4=$'🞂 '
set -x
curl -fsIo /dev/null http://node.moni.0-main.de/metrics
curl -fsIo /dev/null http://grafana.moni.0-main.de/
curl -fso /dev/null http://loki.moni.0-main.de/ready
