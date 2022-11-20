// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

import {add as extAdd } from "./external.sol";

contract Example {
    function add(uint x, uint y) public pure returns (uint) {
        return x + y;
    }
} 