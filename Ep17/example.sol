// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18.0;

contract BlockTransactionInfo {
    event Log(uint value);


    // 獲取當前區塊的區塊數字
    function getBlockNumber() public view returns (uint) {
        return block.number;
    }
    
    // 獲取當前區塊的時間戳
    function getBlockTimestamp() public view returns (uint) {
        return block.timestamp;
    }
    
    // 獲取當前交易的發送者地址
    function getTransactionSender() public view returns (address) {
        return msg.sender;
    }
    
     // 函式：處理交易的數量（接收以太幣）
    function getTransactionValue() public payable {
        /// 在這裡可以對交易數量進行相應的處理, 例如，將接收到的以太幣儲存到合約內部變數中
        /// 獲取交易數量（以太幣）
        uint transactionValue = msg.value;
        emit Log(transactionValue);
        /// 在這裡進行自定義的處理，例如儲存交易數量或進行其他操作...
    }
}