const Ethers = require(ethers);
const Fs = require("fs-extra");
require("dotenv").config()

async function main(){

    let provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL)
    let wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider)

    const Abi = Fs.readFileSync("");
    const Binary = Fs.readFileSync("");

    const ContractFactory = new Ethers.ContractFactory(Abi,Binary,Wallet);

    const Contract = await ContractFactory.deploy();
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
     console.error(error)
     process.exit(1)

})
