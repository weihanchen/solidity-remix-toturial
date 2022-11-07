// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;


contract Example {
    /// 錢包餘額對應表
    /// 錢包地址 <-剩餘-> 金額
    mapping(address => uint) public _balances;

    function updateBalance(uint newBalance) public {
        _balances[msg.sender] = newBalance;
    }

    function get() public view returns(uint) {
        uint _balance = _balances[msg.sender];
        return _balance;
    }

    function remove() public payable {
        delete _balances[msg.sender];
    }
} 