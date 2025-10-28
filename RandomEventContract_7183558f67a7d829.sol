// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    uint256 private value;
    mapping(address => uint256) public balances;

    constructor() {
        value = 0;
    }

    // 触发ValueChanged事件
    function setValue(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;
        
        // 触发事件
        emit ValueChanged(msg.sender, oldValue, _newValue);
    }

    // 触发UserRegistered事件
    function registerUser(string memory _name) public {
        // 触发事件
        emit UserRegistered(msg.sender, _name);
    }

    // 触发Transfer事件
    function transfer(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        
        // 触发事件
        emit Transfer(msg.sender, _to, _amount);
    }

    // 函数用于向账户添加余额以进行转账测试
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}