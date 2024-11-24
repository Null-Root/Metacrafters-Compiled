// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

//import "hardhat/console.sol";

// This is a simple smart contract -> Simple Basic Storage
contract Assessment {

    uint256 private currentValue;
    uint256[] private valueHistory;

    event StoredValue(uint256 value);

    function setStoredValue(uint256 _number) public {
        require(_number != 0, "Value must not be zero!");

        currentValue = _number;
        valueHistory.push(_number);
        emit StoredValue(_number);
    }

    function getStoredValue() public view returns (uint256){
        return currentValue;
    }

    function getStoreHistory() public view returns (uint256[] memory) {
        return valueHistory;
    }

}

