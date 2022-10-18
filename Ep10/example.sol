// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

// 汽車的介面
interface ICar {
    /// @notice 汽車的可以進行驅動
    /// @dev !!! 這邊必須以external進行可視範圍的標示，因為對於介面來說就是外部可視
    function drive() external returns (string memory);
}

contract Truck is ICar {
    function drive() public pure override returns (string memory){
        return "Truck";
    }
}


interface ParentA {
    function weight() external returns (uint256);
}

interface ParentB {
    function weight() external returns (uint256);
}

interface Child is ParentA, ParentB {
    function weight() external override(ParentA, ParentB) returns (uint256);
}