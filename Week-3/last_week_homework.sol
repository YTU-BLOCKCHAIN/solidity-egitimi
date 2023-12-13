// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Voting {
    address[] public candidates;
    address private owner;
    mapping(address => uint) public votes;
    mapping(address => bool) private hasVoted;
    event Vote(address voter, address candidate, uint time);

    constructor() {
        owner = msg.sender;
    }

    function setCandidates(address[] memory _cands) public onlyOwner {
        candidates = _cands;
    }

    function getVotes(address cand) public view returns (uint) {
        return (votes[cand]);
    }

    function vote(address candidate) public isCandExist checkVoted {
        hasVoted[msg.sender] = true;
        votes[candidate]++;
        // emit Vote(msg.sender, candidate, block.timestamp);
    }

    modifier isCandExist() {
        require(candidates.length > 0, "There is no candidates");
        _;
    }

    modifier checkVoted() {
        require(hasVoted[msg.sender] == false, "Voter has already voted");
        _;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of the contract");
        _;
    }
}
