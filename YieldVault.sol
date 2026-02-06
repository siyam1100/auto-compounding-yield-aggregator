// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YieldVault is ERC20, Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable asset;
    address public strategy;

    constructor(address _asset) ERC20("Vault Share", "vAsset") Ownable(msg.sender) {
        asset = IERC20(_asset);
    }

    function setStrategy(address _strategy) external onlyOwner {
        strategy = _strategy;
    }

    function deposit(uint256 _amount) external {
        uint256 shares = totalSupply() == 0 ? _amount : (_amount * totalSupply()) / totalAssets();
        asset.safeTransferFrom(msg.sender, address(this), _amount);
        _mint(msg.sender, shares);
        
        // Push funds to strategy
        asset.safeTransfer(strategy, _amount);
    }

    function totalAssets() public view returns (uint256) {
        // Asks strategy for current balance + local balance
        return asset.balanceOf(address(this)) + IERC20(strategy).balanceOf(address(this)); 
    }
}
