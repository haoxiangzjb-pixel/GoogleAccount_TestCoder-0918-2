// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomEventContract {
    // Define events
    event ValueChanged(address indexed author, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name, uint256 registrationTime);
    event FundsDeposited(address indexed depositor, uint256 amount, uint256 totalBalance);
    event FundsWithdrawn(address indexed withdrawer, uint256 amount, uint256 remainingBalance);
    
    uint256 public value;
    mapping(address => uint256) public userBalances;
    mapping(address => string) public userNames;
    
    constructor() {
        value = 0;
    }
    
    // Function that changes value and triggers ValueChanged event
    function setValue(uint256 _newValue) external {
        uint256 oldValue = value;
        value = _newValue;
        
        // Trigger the ValueChanged event
        emit ValueChanged(msg.sender, oldValue, _newValue);
    }
    
    // Function that registers a user and triggers UserRegistered event
    function registerUser(string memory _name) external {
        userNames[msg.sender] = _name;
        
        // Trigger the UserRegistered event
        emit UserRegistered(msg.sender, _name, block.timestamp);
    }
    
    // Function that deposits funds and triggers FundsDeposited event
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        
        userBalances[msg.sender] += msg.value;
        
        // Trigger the FundsDeposited event
        emit FundsDeposited(msg.sender, msg.value, userBalances[msg.sender]);
    }
    
    // Function that withdraws funds and triggers FundsWithdrawn event
    function withdraw(uint256 _amount) external {
        require(userBalances[msg.sender] >= _amount, "Insufficient balance");
        
        userBalances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
        
        // Trigger the FundsWithdrawn event
        emit FundsWithdrawn(msg.sender, _amount, userBalances[msg.sender]);
    }
    
    // Function to get current value
    function getValue() external view returns (uint256) {
        return value;
    }
}