// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomContract_98765 {
    address payable public owner;
    uint256 public balance;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
    }

    function() external payable {
        balance = address(this).balance;
    }
}