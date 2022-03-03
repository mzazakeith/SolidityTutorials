// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
 contract MoodDiary{
      string mood;

      //create a function that writes a mood to the smart contract
      function setMood(string memory _mood) public{
          mood = _mood;
      }

      //create a function the reads the mood from the smart contract
      function getMood() public view returns(string memory){
         return mood;
      }

 }

