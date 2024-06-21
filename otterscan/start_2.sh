

docker run \
  --rm \
  -p 9988:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://168.119.5.82:32772/" \
  --env BEACON_API_URL="http://168.119.5.82:32776/" \
  otterscan/otterscan:latest

