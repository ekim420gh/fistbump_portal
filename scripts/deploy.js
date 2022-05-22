const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    const accountBalance = await deployer.getBalance();
  
    console.log("Deploying contracts with account: ", deployer.address);
    console.log("Account balance: ", accountBalance.toString());
  
    const fistBumpFactory = await hre.ethers.getContractFactory("fistBumpPortal");
    const fistBump = await fistBumpFactory.deploy();
    await fistBump.deployed();
  
    console.log("fistBumpPortal address: ", fistBump.address);
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error) {
      console.log(error);
      process.exit(1);
    }
  };
  
  runMain();