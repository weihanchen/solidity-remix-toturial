// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Example {
   // 定義事件並接收msg參數
   event Log(string msg);

   fallback() external payable {
       // 當觸發fallback()時，撰寫fallback的訊息
       emit Log("fallback");
   }

   
   receive() external payable  {
       // 當觸發receive()時，撰寫receive的訊息
       emit Log("receive");
   }
}