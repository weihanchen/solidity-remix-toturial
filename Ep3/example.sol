// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

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

    address payable private payableAddr = payable(0xdCad3a6d3569DF655070DEd06cb7A1b2Ccd1D3AF);
    address private addr = address(this);

    function assignAddress() public {
        // the balance of an address using the property 
        payableAddr.balance;
        // end Ether (in units of wei) to a payable address
        payableAddr.transfer(10);
    }

    /// @dev 流程控制範例
    function flowControlExample() public pure {
        /// @notice for...
        /// @dev 累加10次的流程
        uint count0 = 0;
        for (uint i = 0; i < 10; i++) {
            count0 += i;
        }

        /// @dev 相當於上述的for ...
        uint count1 = 0;
        do {
            count1++;
        } while(count1 < 10);

        /// @dev if ... else ...
        bool isOpen = true;
        string memory status = "";
        if (isOpen) {
            status = "activated";
        } else {
            status = "closed";
        }
    }
}