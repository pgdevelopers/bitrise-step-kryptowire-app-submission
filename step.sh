#!/bin/bash
set -ex

echo "path_to_binary: ${path_to_binary}, platform: ${platform}, api_key: ${api_key}"

IP=$(curl -F app=@${path_to_binary} -F key=${api_key} -F platform="${platform}" https://emm.kryptowire.com/api/submit)

if [[ $IP = *"invalid_auth"* ]]; then
  exit 1
fi

envman add --key KRYPTOWIRE_UUID --value IP
