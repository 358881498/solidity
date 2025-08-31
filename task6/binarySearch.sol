// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract binarySearch{
    /*✅ 题目描述：在一个有序数组中查找目标值。
    */
    function search(uint[] memory sortedArray, uint target) 
        public 
        pure 
        returns (int) 
    {
        uint low = 0;
        uint high = sortedArray.length;
        while (low < high) {
            uint mid = (low + high) / 2;
            if (sortedArray[mid] == target) {
                return int(mid);
            } else if (sortedArray[mid] < target) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        return -1; // 未找到返回-1
    }
}