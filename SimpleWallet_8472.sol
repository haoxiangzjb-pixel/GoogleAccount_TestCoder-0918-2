// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        // Function is payable, allowing it to receive Ether
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= address(this).balance, "Insufficient balance");
        owner.transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}