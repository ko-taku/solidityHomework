// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract modifiers {
    address public owner;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _; //함수를 실행할 위치
    }
    function restrictedFunction() public onlyOwner {
        //오직 소유자만 실행 가능
    }

    modifier onlyAdmin(address _admin) {
        require(msg.sender == _admin, "Not authorized");
        _;
    }

    modifier inProgress(bool _status) {
        require(_status == true, "Operation not allowed");
        _;
    }

    bool private locked = false;

    modifier noReentrancy() {
        require(!locked, "No reentrancy allowed");
        locked = true;
        _;
        locked = false;
    }

    function withdraw() public noReentrancy {
        // 재진입 방지된 함수
    }

    mapping(address => bool) public whitelist;

    modifier onlyWhitelisted(address _user) {
        require(whitelist[_user], "User not whitelisted");
        _;
    }

    function setWhitelist(address _user, bool _status) public {
        whitelist[_user] = _status;
    }

    function restrictedFunction2() public onlyWhitelisted(msg.sender) {
        // 화이트리스트에 등록된 사용자만 실행 가능
    }

    bool public paused = false;

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function changeState() public onlyOwner whenNotPaused {
        // 오직 소유자만, 계약이 중지되지 않은 경우 실행 가능
    }
}
