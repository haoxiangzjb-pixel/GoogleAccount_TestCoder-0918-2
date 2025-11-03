// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BalanceStorage {
    // Mapping to store balances for each address
    mapping(address => uint256) public balances;

    // Function to set a balance for an address
    function setBalance(address _addr, uint256 _balance) public {
        balances[_addr] = _balance;
    }

    // Function to get balance of an address
    function getBalance(address _addr) public view returns (uint256) {
        return balances[_addr];
    }

    // Function to increase balance
    function increaseBalance(address _addr, uint256 _amount) public {
        balances[_addr] += _amount;
    }

    // Function to decrease balance
    function decreaseBalance(address _addr, uint256 _amount) public {
        require(balances[_addr] >= _amount, "Insufficient balance");
        balances[_addr] -= _amount;
    }
}