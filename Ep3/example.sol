// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// @title 智能合約範例
contract Example {
    /// @dev 尚未檢查過
    bool private hasChecked = false;

    int256 private xInt256 = -100;
    // int256's alias
    int private xInt = -100;

    // @dev uint無符號的整數型態
    uint8 private xUint8 = 128;

    string private str = "dynamic";

    address payable payableAddr = payable(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF);
    address addr = address(this);

    function assignAddress() public {
        // the balance of an address using the property 
        payableAddr.balance;
        // end Ether (in units of wei) to a payable address
        payableAddr.transfer(10);
    }
}