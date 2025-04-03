// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandle {
    uint256 public value;

    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than 0");
        value = _value;
    }

    function withdraw(uint256 amount, uint256 balance) public pure {
        if (amount > balance) {
            revert("Insufficient balance");
        }
        // 인출 로직
    }

    uint256 public value2 = 1;

    function increment() public {
        value2++;
        assert(value2 != 0); // 오버플로우 방지 (Solidity 0.8.x 이상에서는 자동 체크됨)
    }
}
