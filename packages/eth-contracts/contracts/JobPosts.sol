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

    event JobPosted(address indexed from, uint256 indexed postId);
    event JobRemoved(address indexed from, uint256 indexed postId);

    function postJob(string memory cid) public {
        Job memory _job = Job({owner: msg.sender, cid: cid});

        uint256 _counter = _jobPostsCounter.current();
        jobPosts[_counter] = _job;

        emit JobPosted(msg.sender, _counter);
        _jobPostsCounter.increment();
    }

    function removeJob(uint256 postId) public {
        delete jobPosts[postId];
        emit JobRemoved(msg.sender, postId);
    }
}
