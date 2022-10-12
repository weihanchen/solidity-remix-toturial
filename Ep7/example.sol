// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Example {
    string private state  = "start";

    function pureFunc(uint a, uint b) public pure returns(uint) {
        // ❌ 無法讀取狀態
        // assert(bytes(state).length > 0);
        // ❌ 無法修改狀態
        // state = "doing";
        return a + b;
    }

    function viewFunc(uint a, uint b) public view returns(uint) {
        // ✔️ 可以讀取狀態
        assert(bytes(state).length > 0);
        // ❌ 無法修改狀態
        // state = "doing";
        return a + b;
    }

    function func(uint a, uint b) public returns(uint) {
        // ✔️ 可以讀取狀態
        assert(bytes(state).length > 0);
        // ✔️ 無法修改狀態
        state = "doing";
        return a + b;
    }
}