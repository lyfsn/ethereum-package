


rm -rvf ./el-cl-genesis-data

kurtosis run --enclave devnet . "$(cat ./network_params.json)"

kurtosis files download devnet el-cl-genesis-data ./el-cl-genesis-data

kurtosis enclave rm -f devnet
