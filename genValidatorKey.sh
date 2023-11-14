


rm -rvf ./validator-keys 

kurtosis run --enclave devnet . "$(cat ./network_params.json)"
kurtosis files download devnet 1-lighthouse-geth-0-63 ./validator-keys 
kurtosis enclave rm -f devnet

