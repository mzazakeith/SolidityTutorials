// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
There are two types of import statments

1. Local imports - importing your own solidity file
2. External imports - like from a github url

 */

//  local

import "./AdvancedSolidity.sol";

// external

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

/**
when using hardhat we use OpenZeppelin contracts, but we don't import them externally
we download openzeppelin contracts as a node package using npm
eg. npm install @openzeppelin/contratcts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";  this is a local import 

 */