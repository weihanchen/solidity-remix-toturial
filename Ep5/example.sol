// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Example {
    /// @dev 自訂錯誤類型: 資金不足
    /// @param requested 要求的資金
    /// @param available 可用的資金
    error NotEnoughFunds(uint requested, uint available);

    function withdraw(uint amount) public pure {
        uint total = 100;
        /// @dev 數量必須要是正數
        /// @notice 使用require()， 當條件不滿足時將退回剩下的瓦斯費，所以通常會放在前面
        require(amount >= 0, "invalid uint");

        /// @dev 提款的金額不能大於存款
        /// @notice 若提出的金額超過存款總額，則退回撤銷並退回狀態。
        if (amount > total) {
            revert NotEnoughFunds(amount, total);
        }

        assert(amount <= total);
    }
}