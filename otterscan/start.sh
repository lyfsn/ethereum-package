

docker run \
  --rm \
  -p 9988:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://95.217.233.186:33063/" \
  --env BEACON_API_URL="http://95.217.233.186:33066/" \
  otterscan/otterscan:latest

