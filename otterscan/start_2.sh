

docker run \
  --rm \
  -p 9988:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://37.27.12.92:33102/" \
  --env BEACON_API_URL="http://37.27.12.92:33108/" \
  otterscan/otterscan:latest

