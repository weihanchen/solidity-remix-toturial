// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7.0;

contract OverloadingExample {
    event Log(string msg);

    /// @notice 繪製單點圖
    /// @dev 繪製x軸
    function draw(uint x) public  {    
        emit Log("draw x");
    }

    /// @notice 繪製平面圖
    /// @dev 繪製x、y軸的平面圖
   function draw(uint x, uint y) public  {    
       emit Log("draw x y");
   }

    /// @notice 繪製3D圖
    /// @dev 繪製x、y、z軸的3D圖
    function draw(uint x, uint y, uint z) public {    
        emit Log("draw x y z");
    }
}

