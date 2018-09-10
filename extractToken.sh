cat authResponse | jq .access_token | tr -d '"' > token
