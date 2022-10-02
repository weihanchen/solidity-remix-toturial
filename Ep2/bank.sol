// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// @title 銀行合約
contract Bank {

    /// @notice 記載存款數字
    /// @dev State Variables(狀態變數)
    uint private value;

    /// @notice 記載存款擁有者
    /// @dev State Variables(狀態變數)
    address private owner;

    constructor(uint amount) {
        value = amount;
        owner = msg.sender;
    }

    /// @notice 務必只能存款擁有者...
    /// @dev Function Modifiers(修飾函式) 
    /// msg.sender: 訊息的發送者（或這說是發出這個呼叫的人）
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    /// @notice 存款並增加總資產
    /// @dev Functions(功能)
    function deposit(uint amount) public onlyOwner {
        value += amount;
    }

    /// @notice 資金不足
    /// @dev 自訂錯誤類型
    /// @param requested 要求的資金
    /// @param available 可用的資金
    error NotEnoughFunds(uint requested, uint available);

    /// @notice 提款並減少總資產
    /// @dev Errors(錯誤處理)
    function withdraw(uint amount) public onlyOwner {
        if (amount > value)
            revert NotEnoughFunds(amount, value);
        value -= amount;
    }

    /// @notice 帳號的組成內容
    /// @dev 帳號的組成結構
    struct Account {

        // @notice 帳號的用戶名
        string username;

        // @notice 帳號的識別碼
        string id;
    }

    /// @notice 帳號
    /// @dev 帳號的變數宣告
    Account private account;

    /// @notice 交易狀態
    /// @dev 狀態定義包含Start、Doing、Done
    enum Status  { Start, Doing, Done } 

    /// @notice 狀態
    /// @dev 狀態的變數宣告
    Status private status;

    /// @notice 更新狀態
    /// @dev 將內部的狀態更新為外部指定的狀態
    function set(Status _status) public {
        status = _status;
    }
}