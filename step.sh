#!/bin/bash
set -ex

RESULT=$(curl -F app=@"${path_to_binary}" -F key=${api_key} -F platform="${platform}" https://emm.kryptowire.com/api/submit)

if [[ $RESULT = *"invalid_auth"* ]]; then
  exit 1
fi

envman add --key KRYPTOWIRE_UUID --value $RESULT["uuid"]
