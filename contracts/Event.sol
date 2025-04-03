// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    uint256 public value;
    event ValueChanged(uint256 oldValue, uint256 newValue);

    function updateValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        emit ValueChanged(oldValue, newValue); //이벤트 발생
    }

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function transfer(address to, uint256 amount) public {
        emit Transfer(msg.sender, to, amount);
    }
}
