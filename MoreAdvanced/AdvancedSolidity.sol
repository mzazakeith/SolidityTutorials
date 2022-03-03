// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
// Mappings
// Enums
// Structs
// View and Pure Functions
// Function Modifiers
// Events
// Constructors
// Inheritance
// Transferring ETH
// Calling external contracts
// Import statements
// Solidity Libraries

contract Mapping {
    // like an object in JS
    // so you have a key and value
    // eg. {name:"Keith", age:"22"}

    mapping(address=>string) public moods;
    // you can access someones mood through there address like
    // moods[0xABCDEF....] => string

    function getMood(address user)public view returns (string memory){
        return moods[user];
    }

    function setMood(string memory mood) public {
        moods[msg.sender] = mood;
    }
}