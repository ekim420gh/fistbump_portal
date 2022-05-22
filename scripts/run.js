const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const fistBumpFactory = await hre.ethers.getContractFactory("fistBumpPortal");
    const fistBump = await fistBumpFactory.deploy();
    await fistBump.deployed();
  
    console.log("Contract deployed to:", fistBump.address);
    console.log("Contract deployed by:", owner.address);
  
    let waveCount;
    fistBumpCount = await fistBump.getTotalFistBumps();
    numOfAddresses = await fistBump.getAddressLength();
  
    let fistBumpTxn = await fistBump.fistBump();
    await fistBumpTxn.wait();
  
    fistBumpCount = await fistBump.getTotalFistBumps();
    numOfAddresses = await fistBump.getAddressLength();

    fistBumpTxn = await fistBump.connect(randomPerson).fistBump();
    await fistBumpTxn.wait();
  
    fistBumpCount = await fistBump.getTotalFistBumps();
    numOfAddresses = await fistBump.getAddressLength();
};
  
const runMain = async () => {
try {
    await main();
    process.exit(0); // exit Node process without error
} catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
}
// Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};
  
runMain();