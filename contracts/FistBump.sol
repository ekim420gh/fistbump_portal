// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract fistBumpPortal {
    uint256 totalFistBumps;
    address[] addressArray;

    constructor() {
        console.log("Yooo I am a contract and I am smart");
    }

    function fistBump() public {
        totalFistBumps += 1;
        console.log("%s has fist bumped!", msg.sender);

        addressArray.push(msg.sender);
        console.log("%s has been added to an address array", msg.sender);
    }

    function getTotalFistBumps() public view returns (uint256) {
        console.log("We have %d total fist bumps!", totalFistBumps);
        return totalFistBumps;
    }

    function getAddressLength() public view returns (uint256) {
        console.log("Length of addressArray: %d", addressArray.length);
        return addressArray.length;
    }
}