// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

abstract contract FuelCar {
    // 定義驅動的方法，讓繼承類別各自實作
    function drive() public virtual;

    function fill(uint amount) public {
        // 添加燃油...
    }
}

// 一般燃油轎車
contract Car is FuelCar {
    function drive() public override {
        // 實作一般燃油轎車的驅動方法
    }
}
