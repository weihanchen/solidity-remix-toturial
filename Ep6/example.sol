// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract Base {
    // [Scope]
    //   - inside Base Contract
    //   - inside contracts that inherit this contract
    //   - by other contracts 
    string public publicMsg = "public state variables";

    // [Scope]
    //   - inside Base Contract
    //   - inside contracts that inherit this contract
    string internal internalMsg = "internal state variables";

    // State variables
    // [Scope]
    //   - inside Base Contract
    string private privateMsg = "private state variables";

    // [Scope]
    // - by other contracts
    function externalJob() external pure returns (string memory) {
        return "external job called";
    }

    // [Scope]
    //   - inside this contract
    //   - inside contracts that inherit this contract
    //   - by other contracts 
    function publicJob() public pure returns (string memory) {
        return "public job called";
    }

    // [Scope]
    //   - inside this contract
    //   - inside contracts that inherit this contract
    function internalJob() internal pure returns (string memory) {
        return "internal job called";
    }

    // [Scope]
    //   - inside Base Contract
    function privateJob() private pure returns(string memory) {
        return "private job called";
    }

    function testScope() public virtual  {
        // ❌ 僅能由外部合約進行呼叫
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier. Did you mean "internalJob" or "externalJob"?
        // externalJob();

        // ✔️ 但可以使用這種方式在內部進行調用
        this.externalJob();

        // ✔️ 可以存取「Base」的public Function
        publicJob();

        // ✔️ 可以存取「Base」的internal Function
        internalJob();

         // ✔️ 可以存取「Base」的private Function
        privateJob();

        // --------------------- 以下是狀態變數的測試 ------------------------------ //
        // ✔️ 可以存取「Base」的private 變數
        require(bytes(privateMsg).length > 0, "cannot access private state variable");

        // ✔️ 可以存取「Base」的internal 變數
        require(bytes(internalMsg).length > 0, "cannot access internal state variable");

        // ✔️ 可以存取「Base」的public 變數
        require(bytes(publicMsg).length > 0, "cannot access public state variable");
    }

} 

contract Extend is Base {

    function testScope() public view override {
        // ❌ 無法直接透過繼承存取，僅能以第三方的角度存取
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier. Did you mean "internalJob"?
        // externalJob();

        // ✔️ 可以存取「Base」的public Function
        publicJob();

        // ✔️ 可以存取「Base」的internal Function
        internalJob();

        // ❌ 無法使用基礎合約的私有成員Function
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier
        // privateJob();

        // --------------------- 以下是狀態變數的測試 ------------------------------ //
         // ✔️ 可以存取「Base」的public 變數
        require(bytes(publicMsg).length > 0, "cannot access public state variable");

        // ✔️ 可以存取「Base」的internal 變數
        require(bytes(internalMsg).length > 0, "cannot access internal state variable");

        // ❌ 無法使用基礎合約的私有狀態變數
        // @notice 語法檢測錯誤: DeclarationError: Undeclared identifier.
        // require(bytes(privateMsg).length > 0, "cannot access private state variable");
    }
}

contract External {
    function testScope() public {
        // 宣告Base合約並呼叫其開放外部的Job
        Base b = new Base();

        // ✔️ 可以存取「Base」的external Function
        b.externalJob();

        // ✔️ 可以存取「Base」的public Function
        b.publicJob();

        // ❌ 無法存取「Base」的internal Function
        // @notice 語法檢測錯誤: not found or not visible after argument-dependent lookup in contract Base.
        // b.internalJob();

        // ❌ 無法存取「Base」的private Function
        // @notice 語法檢測錯誤: not found or not visible after argument-dependent lookup in contract Base.
        // b.privateJob();
      
        
        // --------------------- 以下是狀態變數的測試 ------------------------------ //

        // ✔️ 可以存取「Base」的public變數
        b.publicMsg;

        // ❌ 無法存取「Base」的internal變數
        // @notice 語法檢測錯誤: not found or not visible after argument-dependent lookup in contract Base.
        // b.internalMsg;

        // ❌ 無法存取「Base」的private變數
        // @notice 語法檢測錯誤: not found or not visible after argument-dependent lookup in contract Base.
        // b.privateMsg;
    }
}

