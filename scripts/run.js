const main = async () => {
    const fistbump_ContractFactory = await hre.ethers.getContractFactory("fistBumpPortal");
    const fistbump_contract = await fistbump_ContractFactory.deploy();
    await fistbump_contract.deployed();
    console.log("Contract address:", fistbump_contract.address);
  
    let total_fistbumps;
    total_fistbumps = await fistbump_contract.get_total_fistbumps();
    console.log(total_fistbumps.toNumber());
  
    /**
     * Let's send a few fistbumps!
     */
    let fistbump_tx = await fistbump_contract.fistbump("A message!");
    await fistbump_tx.wait(); // Wait for the transaction to be mined
  
    const [_, randomPerson] = await hre.ethers.getSigners();
    fistbump_tx = await fistbump_contract.connect(randomPerson).fistbump("Another message!");
    await fistbump_tx.wait(); // Wait for the transaction to be mined
  
    let all_fistbumps = await fistbump_contract.get_all_fistbumps();
    console.log(all_fistbumps);
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