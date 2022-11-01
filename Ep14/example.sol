// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

import "./math.sol";

contract Example {
    function checkOdd(uint value)  public pure returns(bool) {
        return Math.checkOdd(value);
    }
} 