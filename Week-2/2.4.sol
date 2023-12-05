// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Lottery {
    address public owner;
    address[] public players;
    uint public lotteryId;
    mapping(address => bool) public active_players;
    mapping(uint => address) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function enter() public {
        require(
            active_players[msg.sender] == false,
            "You are already entered lottery"
        );
        players.push((msg.sender));
        active_players[msg.sender] = true;
    }

    //This function concatenate the owner and the block.timestamp, hash them with keecak256, change it type to uint and returns it as random number
    function getRandomNumber() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() public onlyOwner {
        require(
            players.length > 1,
            "Number of players is not greater than  '1'"
        );
        uint index = getRandomNumber() % players.length; //This provides us to get random number beetwen 0 to # of players

        lotteryHistory[lotteryId] = players[index];
        lotteryId++;

        // Reseting active players mapping
        for (uint i = 0; i < players.length; i++) {
            active_players[players[i]] = false;
        }
        // Reseting the players array (winner is picked there is no players anymore)
        players = new address[](0);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of the contract");
        _;
    }
}
