// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FUnctions {
    uint256 public value = 10;

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    function publicFunction() public pure returns (string memory) {
        return "Public";
    }
    function privateFunction() private pure returns (string memory) {
        return "Private";
    }
    function internalFunction() internal pure returns (string memory) {
        return "Internal";
    }
    function externalFunction() external pure returns (string memory) {
        return "External";
    }

    function readValue() public view returns (uint256) {
        return value; //읽기만 가능
    }

    function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b; //상태 변수 접근 없음
    }

    function deposit() public payable {
        //이더를 받을 수 있는 함수
    }

    function getDouble(uint256 number) public pure returns (uint256) {
        return number * 2;
    }

    function getUser() public pure returns (string memory, uint256) {
        return ("Alice", 30);
    }

    function callInternal() public pure returns (string memory) {
        return internalFunction(); //내부에서 internalFunction()을 직접 호출할 수 있다
    }

    function callExternal() public view returns (string memory) {
        return this.externalFunction(); //외부 함수 호출은 this.externalFunction() 형식으로 접근해야한다
    }

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function secureFunction() public onlyOwner {
        //소유자만 실행 가능
    }

    function getValue() public pure returns (uint256) {
        return 1;
    }

    function getValue(uint256 _value) public pure returns (uint256) {
        return _value; //동일한 함수 이름을 사용하지만 매개변수에 따라 다른 함수가 호출된다
    }

    struct User {
        string name;
        uint256 balance;
    }

    User public user;
    function updateUser(string memory _name, uint256 _balance) public {
        User storage storedUser = user; //상태 변수를 직접 참조 (영구 저장소)
        storedUser.name = _name; //영구적으로 상태 변경
        storedUser.balance = _balance;
    }

    function vierUser() public view returns (string memory, uint256) {
        User memory tempUser = user; //메모리로 복사
        return (tempUser.name, tempUser.balance);
    }

    function logMessage(
        string calldata message
    ) external pure returns (string memory) {
        return message; //calldata에서 읽기만 가능
    }

    uint256[] public numbers;

    //상태 변수(numbers)에 값을 저장(영구 저장소)
    function addNumber(uint256 _number) public {
        numbers.push(_number);
    }
    //상태 변수를 참조(영구적으로 변경)
    function updateFirstNumber(uint256 _newNumber) public {
        uint256[] storage storedNumbers = numbers;
        storedNumbers[0] = _newNumber; //상태변수 값 변경
    }

    //상태 변수 복사 (임시 데이터로 처리)
    function getFirstNumber() public view returns (uint256) {
        uint256[] memory copiedNumbers = numbers;
        return copiedNumbers[0]; //상태 변수를 복사해서 반환
    }

    //외부 데이터 입력 처리(읽기 전용)
    function logExternalData(
        uint256[] calldata externalData
    ) external pure returns (uint256) {
        return externalData[0]; //외부 입력 데이터를 반환(변경 불가)
    }
}
