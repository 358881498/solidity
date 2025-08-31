// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract mergeArray{
    /*✅ 题目描述：将两个有序数组合并为一个有序数组。
    */
    function mergeSortedArrays(uint[] memory a, uint[] memory b) 
        public 
        pure 
        returns (uint[] memory) 
    {
        //2个数组合并
        uint[] memory result = new uint[](a.length + b.length);
        for(uint i=0; i<a.length; i++) {
            result[i] = a[i];
        }
        for(uint j=0; j<b.length; j++) {
            result[a.length + j] = b[j];
        }
        //数组低到高排序
        for(uint i=1; i<result.length; i++) {
            uint key = result[i];
            uint j = i;
            while(j > 0 && result[j-1] > key) {
                result[j] = result[j-1];
                j--;
            }
            result[j] = key;
        }
        return result;
    }
}