#!/bin/bash
# Compatibility entry point; setup handles both platforms safely.
set -euo pipefail
root=$(cd "$(dirname "$0")" && pwd)
exec "$root/setup" --platform macos "$@"
