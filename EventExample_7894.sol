// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );
    
    event LogMessage(
        string message,
        uint256 timestamp
    );
    
    event ValueChanged(
        address changer,
        uint256 oldValue,
        uint256 newValue
    );
    
    uint256 public value;
    
    constructor(uint256 _initialValue) {
        value = _initialValue;
        emit ValueChanged(msg.sender, 0, _initialValue);
    }
    
    // 触发Transfer事件的函数
    function transfer(address _to, uint256 _value) external {
        require(_value <= value, "Insufficient balance");
        value -= _value;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _value);
    }
    
    // 触发LogMessage事件的函数
    function logMessage(string memory _message) external {
        emit LogMessage(_message, block.timestamp);
    }
    
    // 触发ValueChanged事件的函数
    function setValue(uint256 _newValue) external {
        uint256 previousValue = value;
        value = _newValue;
        
        // 触发ValueChanged事件
        emit ValueChanged(msg.sender, previousValue, _newValue);
    }
}