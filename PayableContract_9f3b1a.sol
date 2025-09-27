// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PayableContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    // A payable function that receives Ether
    function deposit() public payable {
        // The function body can be empty to just receive funds
        // Or you can add logic here if needed
    }

    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}