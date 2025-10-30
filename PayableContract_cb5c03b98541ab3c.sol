// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address payable public owner;
    uint256 public totalBalance;

    constructor() {
        owner = payable(msg.sender);
    }

    // Payable function that allows the contract to receive Ether
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        totalBalance += msg.value;
    }

    // Another payable function with additional functionality
    function payAndStore(uint256 amount) public payable returns (uint256) {
        require(msg.value >= amount, "Insufficient payment");
        
        totalBalance += msg.value;
        
        // Return the excess amount if any
        uint256 excess = msg.value - amount;
        if (excess > 0) {
            payable(msg.sender).transfer(excess);
        }
        
        return excess;
    }

    // Function to withdraw funds (only owner)
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = address(this).balance;
        totalBalance = 0;
        payable(owner).transfer(amount);
    }

    // Function to check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Fallback function to receive Ether
    receive() external payable {
        totalBalance += msg.value;
    }

    // Fallback function
    fallback() external payable {
        totalBalance += msg.value;
    }
}