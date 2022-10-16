// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Basic {
   string public basic = "basic";
   string public title;

   constructor(string memory _title) {
       title = _title;
   }

   function getTitle() public view returns(string memory) {
       return title;
   }
}

// 繼承自Basic並帶入初始化參數
contract Basic0 is Basic("i am Basic0") {
    string public basic0 = "basic0";
}

// 繼承自Basic並支援外部帶入參數至Basic
contract Basic1 is Basic {
    string public basic1 = "basic1";
    constructor(string memory _title) Basic(_title) {

    }
}

contract Basic2 is Basic, Basic0 {
     // 定義事件並接收msg參數
   event Log(string msg);

    function test() public {
        emit Log(basic);
        emit Log(basic0);
    }
}