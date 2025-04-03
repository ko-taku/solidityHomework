// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Conditional {
    function checkValue(uint256 value) public pure returns (string memory) {
        if (value > 100) {
            return "Value is greater than 100";
        } else if (value == 100) {
            return "Value is exactly 100";
        } else {
            return "Value is less than 100";
        }
    }

    function ternaryCheck(uint256 value) public pure returns (string memory) {
        return (value >= 50) ? "Pass" : "Fail";
    }

    function sumUpTo(uint256 limit) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint i = 1; i <= limit; i++) {
            sum += i;
        }
        return sum;
    }

    function sumWhile(uint256 limit) public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 1;
        while (i <= limit) {
            sum += i;
            i++;
        }
        return sum;
    }

    function breakExample(uint256 limit) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= limit; i++) {
            if (i == 5) {
                break; //i가 5가 되면 반복 종료
            }
            sum += i;
        }
        return sum;
    }

    function continueExample(uint256 limit) public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= limit; i++) {
            if (i % 2 == 0) {
                continue; //짝수는 건너뜀
            }
            sum += i;
        }
        return sum;
    }
}
