// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Mapping to store user balances
    mapping(address => uint256) public balances;
    
    // Event to log deposits
    event Deposit(address indexed user, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed user, uint256 amount);
    
    // Function to deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Must send some Ether");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
    
    // Function to get the contract's total balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}