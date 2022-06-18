// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Fee is Ownable {
    uint256 public FEE = 0;

    event FeeChanged(address indexed from, uint256 indexed fee);

    function changeFee(uint256 fee) public onlyOwner {
        FEE = fee;
        emit FeeChanged(msg.sender, fee);
    }
}
