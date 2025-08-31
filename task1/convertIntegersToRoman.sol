// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract convertIntegersToRoman{
    /*✅ 题目描述：整数转罗马数字
    */
    //定义对应的罗马数字结构体
    struct Numeral {
        uint value;
        string symbol;
    }
    function uintToRoman(uint num) public pure returns (string memory) {
        Numeral[13] memory _numerals = [
            Numeral(1000, "M"),
            Numeral(900, "CM"),
            Numeral(500, "D"),
            Numeral(400, "CD"),
            Numeral(100, "C"),
            Numeral(90, "XC"),
            Numeral(50, "L"),
            Numeral(40, "XL"),
            Numeral(10, "X"),
            Numeral(9, "IX"),
            Numeral(5, "V"),
            Numeral(4, "IV"),
            Numeral(1, "I")
        ];
        string memory roman;
        for (uint256 i = 0; i < _numerals.length; i++) {
            while (num >= _numerals[i].value) {
                roman = string(abi.encodePacked(roman, _numerals[i].symbol));
                num -= _numerals[i].value;
            }
        }
        return roman;
    }
    /*✅ 题目描述：罗马数字转整数
    */
    function romanToUint(string memory s) public pure returns (uint256) {
        bytes memory roman = bytes(s);
        uint256 total = 0;
        uint256 prevValue = 0;
        
        for (uint256 i = 0; i < roman.length; i++) {
            uint256 currentValue = getValue(roman[i]);
            if (currentValue > prevValue) {
                total += currentValue - 2 * prevValue;
            } else {
                total += currentValue;
            }
            prevValue = currentValue;
        }
        return total;
    }

    function getValue(bytes1 c) private pure returns (uint256) {
        if (c == 'I') return 1;
        if (c == 'V') return 5;
        if (c == 'X') return 10;
        if (c == 'L') return 50;
        if (c == 'C') return 100;
        if (c == 'D') return 500;
        if (c == 'M') return 1000;
        return 0;
    }
}
