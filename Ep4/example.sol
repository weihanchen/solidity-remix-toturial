// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Example {
    function TimeUnitExample() public pure {
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

    function validate(uint start, uint secondsAfter) public view {
		// 區塊的時間戳記至少在3秒以前, 才算有效
        if (block.timestamp >= start + secondsAfter * 3 seconds) {
            // ...
        }
    }
}