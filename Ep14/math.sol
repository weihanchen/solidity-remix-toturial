// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

library Math {
    function checkOdd(uint value) public pure returns(bool) {
        uint remainder = value % 2;

        if(remainder!=0)
            return true;
        else
            return false;
    }
}