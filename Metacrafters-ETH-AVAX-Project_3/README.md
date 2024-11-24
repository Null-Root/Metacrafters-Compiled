# WeirdTunaCoin (WTC)

WeirdTunaCoin is an ERC20 token that allows minting by the contract owner, burning by any user, and transferring tokens between addresses.

## Description

WeirdTunaCoin (WTC) is a smart contract that implements the ERC20 standard. It includes the following key functionalities:
- **Minting**: Only the owner can mint new tokens.
- **Burning**: Any user can burn their tokens.
- **Transferring**: Users can send tokens to other addresses.

This project aims to provide a simple yet functional ERC20 token with essential features to manage token supply and facilitate transactions.

## Getting Started

### Installing and Deploying

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file and paste the `WeirdTunaCoin` contract code into the file:
    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";

    contract WeirdTunaCoin is ERC20, Ownable {
        constructor() ERC20("WeirdTunaCoin", "WTC") {}

        ...
    }
    ```
3. Compile the contract by selecting the appropriate compiler version.
4. Deploy the contract using one of the available environments (e.g., JavaScript VM, Injected Web3, etc.).

### Interacting with the Contract

1. In Remix IDE, navigate to the "Deployed Contracts" section.
2. Select the deployed `WeirdTunaCoin` contract.
3. Use the available functions on the UI to interact with the contract, such as minting, burning, and transferring tokens.

## Help

For any issues or questions, please create an issue in the project's repository. You can also refer to the official ERC20 documentation and Remix IDE tutorials for additional guidance.

## Authors

- Patrick James Dionisio

## License

This project currently has no license.
