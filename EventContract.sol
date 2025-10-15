// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Define events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    
    mapping(address => uint256) public balances;
    
    constructor() {
        balances[msg.sender] = 1000;
    }
    
    // Function that triggers Transfer event
    function transfer(address _to, uint256 _value) external {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // Trigger the Transfer event
        emit Transfer(msg.sender, _to, _value);
        
        // Trigger a LogMessage event as well
        emit LogMessage("Transfer completed", block.timestamp);
    }
    
    // Function that triggers Approval event
    function approve(address _spender, uint256 _value) external {
        // Trigger the Approval event
        emit Approval(msg.sender, _spender, _value);
        
        // Trigger a LogMessage event
        emit LogMessage("Approval granted", block.timestamp);
    }
    
    // Function to trigger event manually
    function logCustomMessage(string memory _message) external {
        emit LogMessage(_message, block.timestamp);
    }
    
    // Function to get current balance
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}