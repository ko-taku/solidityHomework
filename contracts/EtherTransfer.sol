// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherTransfer {
    receive() external payable {}

    fallback() external payable {}

    function sendEther(address payable recipient) public payable {
        recipient.transfer(msg.value);
    }

    function sendEther2(
        address payable recipient
    ) public payable returns (bool) {
        bool sent = recipient.send(msg.value);
        require(sent, "Failed to send Ether");
        return sent;
    }

    function sendEther3(address payable recipient) public payable {
        (bool sent, ) = recipient.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    bool private locked;

    modifier noReentrancy() {
        require(!locked, "No reentrancy allowed");
        locked = true;
        _;
        locked = false;
    }

    function withdraw(address payable recipient) public payable noReentrancy {
        (bool sent, ) = recipient.call{value: msg.value}("");
        require(sent, "Withdrawal failed");
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getAddressBalance(address _addr) public view returns (uint256) {
        return _addr.balance;
    }
}
