shared_utils = import_module("github.com/kurtosis-tech/eth2-package/src/shared_utils/shared_utils.star")
mev_boost_context_module = import_module("github.com/kurtosis-tech/eth2-package/src/mev_boost/mev_boost_context.star")

FLASHBOTS_MEV_BOOST_IMAGE = "flashbots/mev-boost"
FLASHBOTS_MEV_BOOST_PORT = 18550
FLASHBOTS_MEV_BOOST_PROTOCOL = "TCP"

USED_PORTS = {
	"api": shared_utils.new_port_spec(FLASHBOTS_MEV_BOOST_PORT, FLASHBOTS_MEV_BOOST_PROTOCOL, wait="5s")
}

NETWORK_ID_TO_NAME = {
	"5":        "goerli",
	"11155111": "sepolia",
	"3":        "ropsten",
}

def launch(plan, mev_boost_launcher, service_name, network_id):
	config = get_config(mev_boost_launcher, network_id)

	mev_boost_service = plan.add_service(service_name, config)

	return mev_boost_context_module.new_mev_boost_context(mev_boost_service.ip_address, FLASHBOTS_MEV_BOOST_PORT)


def get_config(mev_boost_launcher, network_id):
	command = ["mev-boost"]

	if mev_boost_launcher.should_check_relay:
		command.append("-relay-check")

	for relay_endpoint in mev_boost_launcher.relay_end_points:
		command.append("-relays {0}".format(relay_endpoint))

	return ServiceConfig(
		image = FLASHBOTS_MEV_BOOST_IMAGE,
		ports = USED_PORTS,
		cmd = command,
		env_vars = {
			# this is hardcoded to the genesis fork verison on the CL client
			# TODO remove the hardocding
			"GENESIS_FORK_VERSION": "0x10000038",
			"BOOST_LISTEN_ADDR": "0.0.0.0:{0}".format(FLASHBOTS_MEV_BOOST_PORT),
			"SKIP_RELAY_SIGNATURE_CHECK": "true",
			"RELAYS": mev_boost_launcher.relay_end_points[0]
		}
	)


def new_mev_boost_launcher(should_check_relay, relay_end_points):
    return struct(should_check_relay=should_check_relay, relay_end_points=relay_end_points)

