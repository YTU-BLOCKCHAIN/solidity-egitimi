// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Lottery {
    address public owner;
    address payable[] public players;
    uint public lotteryId;
    mapping(uint => address) public lotteryHistory;

    event Enter(address playerAddress, uint lotteryId);
    event PickWinner(address winner, uint lotteryId, uint balance, uint time);

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }

    // sender enters lottery with this function
    function enter() public payable {
        require(msg.value > .01 ether, "Insufficient ether to enter lottery");
        players.push(payable(msg.sender)); //Sender adds to players list
        emit Enter(msg.sender, lotteryId);
    }

    //This function concatenate the owner, the block.timestamp and # of players hash them with keccak256, change it type to uint and returns it as random number
    function getRandomNumber() internal view returns (uint) {
        return
            uint(
                keccak256(
                    abi.encodePacked(owner, block.timestamp, players.length)
                )
            );
    }

    //Owner of the contract can pick winner by calling this function
    function pickWinner() public onlyOwner {
        require(players.length > 1, "Not enough players");

        uint index = getRandomNumber() % players.length; //This provides us to get random number beetwen 0 to # of players
        uint amount = address(this).balance; //Amount of the ETH in the contract
        address payable winner = players[index];
        winner.transfer(amount); //Transfer ETH to the winner

        emit PickWinner(winner, lotteryId, amount, block.timestamp);

        lotteryHistory[lotteryId] = winner; //The winner is saved to the history of the lotteries
        lotteryId++;

        // Reseting the players array (winner picked there is no need old players anymore)
        delete players;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
}
