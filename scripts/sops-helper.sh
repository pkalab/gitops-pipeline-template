#!/bin/bash
set -euo pipefail

COMMAND="${1:-help}"
FILE="${2:-}"

case "$COMMAND" in
  encrypt)
    if [[ -z "$FILE" ]]; then
      echo "Usage: $0 encrypt <file.yaml>"
      exit 1
    fi
    sops --encrypt "$FILE" > "${FILE%.yaml}.enc.yaml"
    echo "Encrypted: ${FILE%.yaml}.enc.yaml"
    ;;
  decrypt)
    if [[ -z "$FILE" ]]; then
      echo "Usage: $0 decrypt <file.enc.yaml>"
      exit 1
    fi
    sops --decrypt "$FILE" > "${FILE%.enc.yaml}.yaml"
    echo "Decrypted: ${FILE%.enc.yaml}.yaml"
    ;;
  rotate-key)
    sops --rotate --in-place "${FILE}"
    ;;
  *)
    echo "Usage: $0 {encrypt|decrypt|rotate-key} <file>"
    exit 1
    ;;
esac
