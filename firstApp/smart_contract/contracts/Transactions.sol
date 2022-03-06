// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Transactions{
    uint256 transactionCount;

    event Transfer(address from, address to, uint amount, string message, uint256 timestamp, string keyword);

    struct TransferStruct{
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        transactionCount +=1;
        transactions.push(TransferStruct({
        sender:msg.sender,
        receiver:receiver,
        amount:amount,
        message:message,
        timestamp:block.timestamp,
        keyword:keyword
        }));
        emit Transfer({
        sender:msg.sender,
        receiver:receiver,
        amount:amount,
        message:message,
        timestamp:block.timestamp,
        keyword:keyword
        });
    }

    function getAllTransaction() public view returns (TransferStruct[] memory){
        return transactions;
    }

    function getTransactionCount() public view returns (uint256){
        return transactionCount;
    }
}