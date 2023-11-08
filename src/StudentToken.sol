// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;
import "./IStudentToken.sol";
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract MyContract is ERC20,IStudentToken {

    constructor() ERC20("JeanToken", "jtsd") {
        
        _mint(msg.sender, 1000000000000000);
        _approve(address(this), 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE,10000000);
        
    }
    function createLiquidityPool() external
    {

    }

	function SwapRewardToken() external{

    }
}
