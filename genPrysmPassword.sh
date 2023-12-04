


rm -rvf ./el-cl-genesis-data

kurtosis run --enclave devnet . "$(cat ./network_params.json)"

kurtosis files download devnet prysm-password ./prysm-password

kurtosis enclave rm -f devnet
