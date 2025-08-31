// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract reverseString{
    /*✅ 题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
    */
    function str(string memory input) public 
    pure  returns(string memory) {
        uint length = bytes(input).length; // 获取字符串长度
        bytes memory reversedBytes = new bytes(length); // 创建一个新的字节数组来存储反转后的字符串
        for (uint i = 0; i < length; i++) {
            reversedBytes[i] = bytes(input)[length - 1 - i]; // 从后往前复制字符
        }
        return string(reversedBytes); // 将字节数组转换为字符串并返回
    }
    
}