// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract WeirdTunaCoin is ERC20, Ownable {

    constructor(string memory name, string memory symbol)
        ERC20(name, symbol)
        Ownable(msg.sender) {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(address receiver, uint256 amount) public override returns (bool) {
        require(receiver != address(0), "Receiver address cannot be the zero address");
        _transfer(msg.sender, receiver, amount);
        return true;
    }
}
