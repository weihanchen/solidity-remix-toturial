// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Example {
    function etherUnitExample() public pure {

        // wei是貨幣中的最小單位
        require(1 wei == 1, "1 wei is not equal to 1");

        // 1 gwei is equal to 10^9 wei
        require(1 gwei == 1e9, "1 gwei is not equal to 1e9");

        // 1 ether is equal to 10^18 wei
        require(1 ether == 1e18, "1 ether is not equal to 1e18");
    }

    function timeUnitExample() public pure {
        // 1秒
        assert(1 seconds == 1);

        // 1分鐘 = 60秒
        assert(1 minutes == 60 seconds);

        // 1小時 = 60分鐘
        assert(1 hours == 60 minutes);

        // 1天=24小時
        assert(1 days == 24 hours);

        // 1周 = 7天
        assert(1 weeks == 7 days);
    }

    function validate(uint start, uint secondsAfter) public view returns(bool) {
        bool isValidated = false;

		/// 區塊的時間戳記至少在3秒以前, 才算有效。
        /// 注意: 此為範例，真實合約請不要使用block.timestamp來進行檢驗，具有弱點風險。
        if (block.timestamp >= start + secondsAfter * 3 seconds) {
            isValidated = true;
        }
        
        return isValidated;
    }
}