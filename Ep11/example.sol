// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Parent {
    event Log(string msg);

    /// @notice 工作
    /// @dev 欲被繼承的方法應使用virtual關鍵字宣告 
    function doJob() public virtual {
        emit Log("i am parent");
    }
}

contract Child is Parent {

    /// @notice 工作
    /// @dev 繼承並覆寫應使用override關鍵字宣告
    function doJob() public override {
        /// @dev 呼叫上游的方法
        super.doJob();

        /// @dev 再進行擴充
        emit Log("i am child");
    }
}

