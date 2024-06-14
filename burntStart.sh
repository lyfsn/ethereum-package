TARGET_TIMESTAMP=1717200000
NEW_TIMESTAMP=$((TARGET_TIMESTAMP - 60))
sudo date +%s -s @$NEW_TIMESTAMP

kurtosis run --enclave my-testnet . --args-file network_params.yaml