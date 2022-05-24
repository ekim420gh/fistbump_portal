// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract fistBumpPortal {
    uint256 total_fistbumps;

    /*
     * A little magic, Google what events are in Solidity!
     */
    event NewFist(address indexed from, uint256 timestamp, string message);

    /*
     * I created a struct here named Fist.
     * A struct is basically a custom datatype where we can customize what we want to hold inside it.
     */
    struct Fist {
        address fistbumper; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Fist[] fists;

    constructor() {
        console.log("i am a fistbumps contract.");
    }

    /*
     * now it requires a string called _message. This is the message our user
     * sends us from the frontend!
     */
    function fistbump(string memory _message) public {
        total_fistbumps += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        /*
         * This is where I actually store the fistbump data in the array.
         */
        fists.push(Fist(msg.sender, _message, block.timestamp));

        /*
         * I added some fanciness here, Google it and try to figure out what it is!
         * Let me know what you learn in #general-chill-chat
         */
        emit NewFist(msg.sender, block.timestamp, _message);
    }

    /*
     * I added a function get_all_fistbumps which will return the struct array, waves, to us.
     * This will make it easy to retrieve the waves from our website!
     */
    function get_all_fistbumps() public view returns (Fist[] memory) {
        return fists;
    }

    function get_total_fistbumps() public view returns (uint256) {
        // Optional: Add this line if you want to see the contract print the value!
        // We'll also print it over in run.js as well.
        console.log("We have %d total fistbumps!", total_fistbumps);
        return total_fistbumps;
    }
}