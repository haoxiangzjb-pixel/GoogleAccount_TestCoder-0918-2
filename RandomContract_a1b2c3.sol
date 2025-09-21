// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    address payable public owner;
    
    // Event to log deposits
    event Deposit(address indexed from, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed to, uint256 amount);
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    // A payable function that can receive Ether
    function deposit() public payable {
        require(msg.value > 0, "Must send some Ether");
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to withdraw all Ether from the contract
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 balance = address(this).balance;
        require(balance > 0, "No Ether to withdraw");
        
        emit Withdrawal(msg.sender, balance);
        owner.transfer(balance);
    }
    
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}