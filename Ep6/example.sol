// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Base {
    // State variables
    // [Scope]
    //   - inside Base Contract
    string private privateMsg = "private state variables";

    // [Scope]
    //   - inside Base Contract
    //   - inside contracts that inherit this contract
    string internal internalMsg = "internal state variables";

    // [Scope]
    //   - inside Base Contract
    //   - inside contracts that inherit this contract
    //   - by other contracts 
    string public publicMsg = "public state variables";

    // [Scope]
    //   - inside Base Contract
    function privateJob() private pure returns(string memory) {
        return "private job called";
    }

    // [Scope]
    //   - inside this contract
    //   - inside contracts that inherit this contract
    function internalJob() internal pure returns (string memory) {
        return "internal job called";
    }

    // [Scope]
    //   - inside this contract
    //   - inside contracts that inherit this contract
    //   - by other contracts 
    function publicJob() public pure returns (string memory) {
        return "public job called";
    }

    // [Scope]
    // - by other contracts
    function externalJob() external pure returns (string memory) {
        return "external job called";
    }


    function testScope() public virtual  {
        // 可存取私有成員
        privateJob();

        // 可存取內部成員
        internalJob();

        // 可存取公開成員
        publicJob();

        // @dev 🚫 僅能由外部合約進行呼叫
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier. Did you mean "internalJob" or "externalJob"?
        // externalJob();

        // --------------------- 以下是狀態變數的測試 ------------------------------ //
        require(bytes(privateMsg).length > 0, "cannot access private state variable");

        require(bytes(internalMsg).length > 0, "cannot access internal state variable");

        require(bytes(publicMsg).length > 0, "cannot access public state variable");
    }

} 

contract Base0 is Base {

    function testScope() public view override {
        // @dev 🚫 無法使用基礎合約的私有成員Function
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier
        // privateJob();

        // call base's internal job
        internalJob();

        // call base's public job
        publicJob();

        // @dev 🚫 無法直接透過繼承存取，僅能以第三方的角度存取
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier. Did you mean "internalJob"?
        // externalJob();

        // --------------------- 以下是狀態變數的測試 ------------------------------ //
        // @dev 🚫 無法使用基礎合約的私有狀態變數
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier.
        // require(bytes(privateMsg).length > 0, "cannot access private state variable");

        require(bytes(internalMsg).length > 0, "cannot access internal state variable");

        require(bytes(publicMsg).length > 0, "cannot access public state variable");
    }
}

contract External {
    function testScope() public {
        // 宣告Base合約並呼叫其開放外部的Job
        Base b = new Base();
        b.externalJob();
    }
}

