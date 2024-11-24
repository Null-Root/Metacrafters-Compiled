// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract BasicCalculator {

    uint256[] public pastResults;

    function add(uint256 num1, uint256 num2) public returns(uint256) {

        uint256 result = num1 + num2;
        assert(result >= num1);

        // Add result
        pastResults.push(result);

        return result;
    }

    function subtract(uint256 num1, uint256 num2) public returns(uint256) {
        if (num1 < num2) {
            revert("num1 must be greater than or equal to num2");
        }
        
        uint256 result = num1 - num2;
        assert((num2 >= 0 && result <= num1) || (num2 < 0 && result > num1));

        // Add result
        pastResults.push(result);

        return result;
    }

    function multiply(uint256 num1, uint256 num2) public returns(uint256) {

        uint256 result = num1 * num2;
        assert(result / num1 == num2);

        // Add result
        pastResults.push(result);

        return result;
    }

    function divide(uint256 num1, uint256 num2) public returns(uint256) {
        // Ensure num2 is not zero
        require(num2 != 0, "Cannot divide by zero");

        uint256 result = num1 / num2;

        // Add result
        pastResults.push(result);

        return result;
    }

    function clearPastResults() public  {
        delete pastResults;
    }
}
