// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

// 汽車的介面
interface Car {
    // 汽車的可以進行驅動
    // !!! 這邊必須以external進行可視範圍的標示，因為對於介面來說就是外部可視
    function drive() public pure;
}

contract Truck is Car {
    function drive() public pure {

    }
}