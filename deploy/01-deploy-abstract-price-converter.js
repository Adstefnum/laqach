module.exports = async ({
  getNamedAccounts,
  deployments,
  getChainId,
  network,
}) => {
  const {deploy} = deployments;
  const {deployer} = await getNamedAccounts();
 
};