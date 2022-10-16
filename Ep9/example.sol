// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Basic {
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

}

// 繼承自Basic並支援外部帶入參數至Basic
contract Basic1 is Basic {
    constructor(string memory _title) Basic(_title) {

    }
}