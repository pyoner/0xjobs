// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ServiceFee is Ownable {
    uint256 public serviceFee = 0;

    event FeeChanged(address indexed from, uint256 indexed fee);

    function setFee(uint256 fee) public onlyOwner {
        serviceFee = fee;
        emit FeeChanged(msg.sender, fee);
    }
}
