// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Work {
    uint salary;

    // Create a new work contract to initialize the salary
    constructor() {
        salary = 0;
    }

    // Increase your salary once you work
    function doWork() public {
        salary += 1;
    }

    // Pay salary
    function pay() public view returns (uint) {
        return salary;
    }
}