// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] addressArray;

    constructor() {
        console.log("Yooo I am a contract and I am smart");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        addressArray.push(msg.sender);
        console.log("%s has been added to an address array", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAddressLength() public view returns (uint256) {
        console.log("Length of addressArray: %d", addressArray.length);
        return addressArray.length;
    }
}