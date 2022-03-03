// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// GameItem is  ERC721 signifies that the contract we are creating imports ERC721 and follows ERC721 contract from openzeppelin
contract KeithItem is ERC721 {

    constructor() ERC721("KeithItem", "ITM") {
        // mint an NFT to yourself
        _mint(msg.sender, 1);
    }
}
