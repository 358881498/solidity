// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.9.0;

contract whitelist{
    // //定义白名单地址变量
    // mapping(address => bool) private whitelistedAddresses;
    // //添加地址到白名单
    // function addToWhitelist(address _address) public returns (string memory res) {
    //     require(!whitelistedAddresses[_address], "The address already exists");
    //     whitelistedAddresses[_address] = true;
    //     return "Whitelist added successfully";
    // }
    // //判断是否为地址白名单
    // function isWhitelisted(address _address) public view returns (bool) {
    //     return whitelistedAddresses[_address];
    // }
    //编写一个智能合约，允许用户存款并设置一个特定的地址为白名单地址，只有该地址能够提取合约中的资金。
    //实现一个功能，允许用户查询自己在合约中的余额，并且测试存款、提取和余额查询功能的正确性。
    mapping(address => uint256) private balances;
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance.");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}