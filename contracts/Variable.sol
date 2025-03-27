// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variable {
    constructor() {
        owner = msg.sender; //배포 시점에만 값 설정 가능, 보안성이 향상된다
    }

    address public immutable owner;

    uint256 private secretValue = 31; //상태 변수

    function reveal() public view returns (uint256) {
        return secretValue;
    }

    function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b; //로컬 변수
        return sum;
    }

    struct User {
        string name;
        uint256 age;
    }

    User public user;

    function viewUser() public view returns (string memory, uint256) {
        User memory tempUser = user; // 메모리로 복사
        return (tempUser.name, tempUser.age); //읽기 전용
    }

    uint public constant FIXED_VALUE = 100; //수젇불가능, 배포 시점에 고정된 값
}
