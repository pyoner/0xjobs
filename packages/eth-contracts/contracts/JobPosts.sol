// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract JobPosts {
    using Counters for Counters.Counter;
    Counters.Counter private _jobPostsCounter;

    struct Job {
        address owner;
        string cid; // ipfs content id (CID)
    }

    mapping(uint256 => Job) public jobPosts;

    function postJob(string memory cid) public returns (uint256) {
        Job memory _job = Job({owner: msg.sender, cid: cid});
        uint256 _counter = _jobPostsCounter.current();
        jobPosts[_counter] = _job;

        _jobPostsCounter.increment();
        return _jobPostsCounter.current();
    }

    function removeJob(uint256 id) public {
        delete jobPosts[id];
    }
}
