// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract Lottery {
    address public owner;
    address payable [] public players;
    uint public lottery_id;
    mapping(uint => address) lottery_history;


    constructor () {
        owner = msg.sender;
        lottery_id = 1;
    }

    function getPlayers() public view returns(address payable[] memory) {
        return players;
    }

    function check_history(uint _lottery_id) public view returns(address){
        return lottery_history[_lottery_id];
    }


    function enterLottery() public payable{
        require(msg.sender != owner,"You cant enter");
        require(msg.value == .01 ether,"Insufficent ether");
        players.push(payable(msg.sender));
    }

    function getRandomNumber() internal view returns(uint){
        return (uint(keccak256(abi.encode(owner, block.timestamp, players.length))));
    }

    function pickWinner() public payable onlyOwner {
        require(players.length > 1,"There is no enough players");
        uint winner_index = getRandomNumber() % players.length;

        uint amount = (address(this).balance - .01 ether);
        address payable winner = players[winner_index];
        winner.transfer(amount);

        lottery_history[lottery_id] = winner;
        lottery_id++;

        delete players;
    }

    function withdraw() public payable onlyOwner{
        payable(owner).transfer(payable(address(this)).balance);
    }



    modifier onlyOwner() {
        require(owner == msg.sender,"You are not owner of the contract");
        _;
    }


}