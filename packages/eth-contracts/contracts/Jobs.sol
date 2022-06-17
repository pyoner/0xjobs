// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./JobToken.sol";

contract Jobs is JobToken {
    using Counters for Counters.Counter;
    Counters.Counter private _jobsCounter;

    struct Job {
        address owner;
        string cid; // ipfs content id (CID)
    }

    mapping(uint256 => Job) public jobs;

    event JobPosted(address indexed from, uint256 indexed id);
    event JobRemoved(address indexed from, uint256 indexed id);

    function postJob(string memory cid) public {
        Job memory _job = Job({owner: msg.sender, cid: cid});

        uint256 _counter = _jobsCounter.current();
        jobs[_counter] = _job;

        emit JobPosted(msg.sender, _counter);
        _jobsCounter.increment();
    }

    function removeJob(uint256 id) public {
        delete jobs[id];
        emit JobRemoved(msg.sender, id);
    }
}
