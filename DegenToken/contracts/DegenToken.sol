// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    mapping(uint => bool) private itemsRedeemed;

    constructor()
    ERC20("Degen", "DGN")
    Ownable()
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); 
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Current DGN tokens are not enough to cover the transfer!");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "Current DGN tokens are not enough to cover burn of the requested amount!");
        burn(_value);
    }

    function redeemTokens(uint8 input) external payable returns (string memory) {
        // Check if input is within range 0 - 3
        require(input < 4, "Only inputs 0 - 3 are allowed");
        require(itemsRedeemed[input] == false, "Item selected has been already redeemed! Please choose another item!");

        // Check if item has already been redeemed (based on address)
        string memory selectedItemName;
        uint selectedItemTokensRequired;

        // Check items
        if (input == 0) {
            selectedItemName = "League of Legends - Shaco NFT";
            selectedItemTokensRequired = 55;
        }
        if (input == 1) {
            selectedItemName = "Apple NFT";
            selectedItemTokensRequired = 12;
        }
        if (input == 2) {
            selectedItemName = "Toy Story Merch";
            selectedItemTokensRequired = 43;
        }
        if (input == 3) {
            selectedItemName = "Arm NFT";
            selectedItemTokensRequired = 25;
        }

        require(balanceOf(msg.sender) >= selectedItemTokensRequired, "Current DGN tokens are not enough to cover the redeem!");

        approve(msg.sender, selectedItemTokensRequired);
        transferFrom(msg.sender, owner(), selectedItemTokensRequired);

        // Change status to true (This tells that the item has been redeemed already)
        itemsRedeemed[input] = true;

        return string.concat(selectedItemName, " has been redeemed!");
    }

    function showStoreItems() public pure returns (string memory) {
        return  " 1. League of Legends - Shaco NFT "
                " 2. Apple NFT "
                " 3. Toy Story Merch "
                " 4. Arm NFT ";
    }
}