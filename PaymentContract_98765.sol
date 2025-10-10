// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function pay() public payable {
        // Function logic can be added here
    }

    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }
}