// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Modifiers {
    address public owner;

    uint public secret_number;

    constructor() {
        owner = msg.sender;
        secret_number = block.timestamp;
    }

    function set_secret_number(uint new_secret_number) public onlyOwner {
        secret_number = new_secret_number;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner of the contract");
        _;
    }
}

contract ifElseVeLoops {
    uint public min_limit = 15;
    uint public max_limit = 50;
    uint public counter = 0;

    function is_counter_between_limits() public view returns (bool) {
        if (counter > min_limit && counter < max_limit) {
            // && => ve , || => veya , == => eşit mi, != => eşit değil mi
            return true;
        } else {
            return false;
        }
    }

    function cumulative_sum_to_ten() public {
        for (uint8 i = 0; i <= 10; i++) {
            counter += i;
        }

        // uint8 j = 0;
        // while(j < 10){
        //     counter += j;
        //     j++;
        // }
    }
}
