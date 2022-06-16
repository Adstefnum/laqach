const {getNamedAccounts,deployments,network} = require("hardhat")
const {NetworkConfig} = require("../helper-hardhat-config")


module.exports = async ({
  getNamedAccounts,
  deployments,
  getChainId,
  network,
}) => {
  const {deploy} = deployments;
  const {deployer} = await getNamedAccounts();
 
};