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

    /// @dev The constructor sets the original `amount` of the contract to the bank.
    /// @param amount 存款開戶的金額數量
    constructor(uint amount) {
        value = amount;
        owner = msg.sender;
    }

    /// @dev Function Modifiers(修飾函式): 務必只能存款擁有者...
    /// msg.sender: 訊息的發送者（或這說是發出這個呼叫的人）
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    /// @dev Functions(功能): 存款並增加總資產
    /// @param amount 欲存款的金額數量
    function deposit(uint amount) public onlyOwner {
        value += amount;
    }

    /// @dev 自訂錯誤類型: 資金不足
    /// @param requested 要求的資金
    /// @param available 可用的資金
    error NotEnoughFunds(uint requested, uint available);

    /// @dev Errors(錯誤處理): 提款並減少總資產
    /// @param amount 提款的金額數量
    /// @notice revert可以直接填上錯誤訊息或者自訂錯誤類型，稱之revert主要是在還沒改變狀態之前撤銷。
    function withdraw(uint amount) 
        public onlyOwner
    {
        if (amount > value)
            revert NotEnoughFunds(amount, value);

        value -= amount;
    }

    /// @dev 帳號的組成內容
    struct Account {

        // @dev 帳號的用戶名
        string username;

        // @dev 帳號的識別碼
        string id;
    }

    /// @dev 帳號的變數宣告
    Account private account;

    /// @dev 狀態定義包含Start、Doing、Done
    enum Status  { Start, Doing, Done } 

    /// @dev 狀態的變數宣告
    Status private status;

    /// @dev 將內部的狀態更新為外部指定的狀態
    /// @param _status 欲更新的狀態
    function set(Status _status) public {
        status = _status;
    }
}