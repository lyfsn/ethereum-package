


rm -rvf ./validator-keys 

kurtosis run --enclave devnet . "$(cat ./network_params.json)"

kurtosis files download devnet 1-lighthouse-geth-0-63 ./validator-keys 
kurtosis files download devnet 2-lighthouse-geth-64-127 ./validator-keys
kurtosis files download devnet 3-lighthouse-geth-128-191 ./validator-keys
kurtosis files download devnet 4-lighthouse-geth-192-255 ./validator-keys
kurtosis files download devnet 5-lighthouse-geth-256-319 ./validator-keys
kurtosis files download devnet 6-lighthouse-geth-320-383 ./validator-keys
kurtosis files download devnet 7-lighthouse-geth-384-447 ./validator-keys
kurtosis files download devnet 8-lighthouse-geth-448-511 ./validator-keys
kurtosis files download devnet 9-lighthouse-geth-512-575 ./validator-keys


kurtosis enclave rm -f devnet
