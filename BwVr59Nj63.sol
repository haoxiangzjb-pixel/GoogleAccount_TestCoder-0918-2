// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    event UserAction(address indexed user, string action, uint256 data);

    // 存储变量
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000;
    }

    // 触发Transfer事件的函数
    function sendTokens(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _amount);
    }

    // 触发LogMessage事件的函数
    function logSomething(string memory _message) public {
        // 触发LogMessage事件
        emit LogMessage(_message, block.timestamp);
    }

    // 触发UserAction事件的函数
    function performAction(string memory _action, uint256 _data) public {
        // 触发UserAction事件
        emit UserAction(msg.sender, _action, _data);
    }

    // 获取当前时间戳的辅助函数
    function getCurrentTime() public view returns (uint256) {
        return block.timestamp;
    }
}