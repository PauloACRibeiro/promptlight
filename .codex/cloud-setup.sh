#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

if [[ -f package-lock.json ]]; then
  npm ci
else
  npm install
fi

if [[ "${INSTALL_PLAYWRIGHT_BROWSERS:-0}" == "1" ]]; then
  npx playwright install --with-deps chromium
fi
