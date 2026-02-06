// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AaveStrategy {
    address public vault;
    address public underlying;
    address public constant AAVE_POOL = 0x87870B2ec33647f9224823855518170c5e5Ba033; // Mock

    constructor(address _vault, address _underlying) {
        vault = _vault;
        underlying = _underlying;
    }

    function harvest() external {
        // 1. Claim AAVE/Rewards
        // 2. Swap Rewards for 'underlying' via Uniswap
        // 3. Redeposit 'underlying' into Aave
    }

    function balanceOfVault() public view returns (uint256) {
        // Returns amount currently earning interest in Aave
        return IERC20(underlying).balanceOf(address(this));
    }
}
