#!/usr/bin/env bash
# Atria A2A agent. Requires ATRIA_API_KEY in the environment (never written here).
set -euo pipefail
AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${AGENT_DIR}/../.." && pwd)"

if [[ -z "${ATRIA_API_KEY:-}" ]]; then
  echo "ERROR: ATRIA_API_KEY is not set" >&2; exit 1
fi

# Atria endpoint — the SDK inherits process.env, so exporting here is enough.
export ANTHROPIC_BASE_URL="https://api.atria-asi.ai"
export ANTHROPIC_AUTH_TOKEN="${ATRIA_API_KEY}"
export CLAUDE_CODE_MAX_CONTEXT_TOKENS=256000
export CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT=1
export CONFIG_FILE="${AGENT_DIR}/config.json"
export WORKSPACE_DIR="${WORKSPACE_DIR:-/home/m7r/Work/openwa-oci-infra}"

exec "${ROOT_DIR}/server.sh" "$@"
