#!/usr/bin/env bash
set -euo pipefail
AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${AGENT_DIR}/../.." && pwd)"
export CONFIG_FILE="${AGENT_DIR}/config.json"
export WORKSPACE_DIR="${WORKSPACE_DIR:-/home/m7r/Work/openwa-oci-infra}"
exec "${ROOT_DIR}/server.sh" "$@"
