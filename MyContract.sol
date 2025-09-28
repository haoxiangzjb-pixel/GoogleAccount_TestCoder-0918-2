// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    // A payable function that accepts Ether
    function payMe() public payable {
        // Function body can be empty to just receive funds
        // Or add logic here if needed
    }

    // Function to check the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}