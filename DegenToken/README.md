# DegenToken Project

DegenToken (DGN) is a decentralized ERC20 token built on the Avalanche blockchain.


## Description

The DegenToken smart contract is written in Solidity and deployed on the Avalanche blockchain. It leverages the OpenZeppelin library for secure and standardized ERC20 token implementation. It has the following key features:

### Key Features

1. **Minting Tokens:** 
   - The platform owner has the ability to mint new DegenTokens. This feature allows Degen Gaming to distribute tokens as rewards to players based on their in-game achievements and activities.
   - **Function:** `mint(address to, uint256 amount)`
   - **Access:** Only the contract owner can mint new tokens.

2. **Transferring Tokens:**
   - Players can transfer their DegenTokens to other players. This feature promotes a dynamic in-game economy where players can trade tokens for goods, services, or other tokens.
   - **Function:** `transferTokens(address _receiver, uint256 _value)`
   - **Requirement:** The sender must have a sufficient balance of DegenTokens.

3. **Redeeming Tokens:**
   - Players can redeem their DegenTokens for exclusive items available in the in-game store. Each item has a predefined token cost, and once redeemed, the item is marked as redeemed and cannot be redeemed again.
   - **Function:** `redeemTokens(uint8 input)`
   - **Requirement:** The player must have enough tokens to cover the cost of the item, and the item must not have been previously redeemed.

4. **Checking Token Balance:**
   - Players can check their DegenToken balance at any time. This transparency ensures players are always aware of their available tokens, enabling informed decisions about spending and saving.
   - **Function:** `getBalance()`
   - **Output:** Returns the player's token balance.

5. **Burning Tokens:**
   - Players can burn their DegenTokens if they no longer need them. This feature reduces the total supply of tokens, potentially increasing the value of remaining tokens.
   - **Function:** `burnTokens(uint256 _value)`
   - **Requirement:** The player must have enough tokens to cover the burn amount.

6. **Store Items:**
   - The smart contract includes a predefined list of store items that players can redeem with their tokens. Each item has a unique identifier, name, token cost, and redemption status.
   - **Function:** `showStoreItems()`
   - **Output:** Returns a list of available store items with their details.


## Getting Started

### Pre-requisite
0. You must have a metamask wallet, account, and existing balance on the Avalanche Fuji Testnet

### Downloading a copy of the Project
1. Clone or Download this Repository
2. Open the terminal in the root directory of the project
3. Run ```npm install```
4. Wait until all of the dependencies have been installed

### Connecting to Remix
5. Run ```remixd```
6. Go to remix and select the "File Explorer" tab
7. Under the "Workspaces", choose and select the "connect to localhost"
8. Click "Connect"

### Compiling and Deploying
9. Under the "Solidity compiler" tab, click the Compile button (This may be unnecessary if auto compile is enabled)
10. Switch to the "Deploy & run transactions" tab
11. Under the "Environment", select the "Injected Provider - Metamask"
12. Check the metamask wallet and see if connected to the Avalanche Fuji Testnet

    ---------------------------------------------------
14. If you want to deploy your contract, Click the "Deploy" button
15. If you want to check my deployed contract, paste this ```0xd19714f9637939eF61D2ab6eE9bE27213E563A8E``` on the side of the "At Address" button then click the said button

## Help

For any issues or questions, Please refer to the official ERC20 documentation and Remix IDE tutorials for additional guidance.


## Authors

Contributors names and contact info

Patrick James C. Dionisio
