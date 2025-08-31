// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Voting{
    /*✅ 创建一个名为Voting的合约，包含以下功能：
        一个mapping来存储候选人的得票数
        一个vote函数，允许用户投票给某个候选人
        一个getVotes函数，返回某个候选人的得票数
        一个resetVotes函数，重置所有候选人的得票数
    */
    // 存储候选人的得票数
    mapping(address => uint56) private candidate;
    mapping(address => bool) private voter;
    address[] private voters;
    address[] private candidates;
    //用户投票给某个候选人
    function vote(address _candidate) public returns (bool) {
        require(!voter[msg.sender], unicode"您已经投过票了！");
        //记录投票记录
        voter[msg.sender] = true;
        //增加候选人投票数量
        candidate[_candidate]++;
        //将候选人和投票人存入数组，后续用于重置票数和投票权
        voters.push(msg.sender);
        candidates.push(_candidate);
        return true;
    }
    //获取某个候选人的得票数
    function getVotes(address _candidate) public view returns (uint56) {
        return candidate[_candidate];
    }
    //重置所有候选人的得票数
    function resetVotes() public returns (bool) {
        for (uint i=0;i<candidates.length;i++) {
            //重置当前候选人的得票数
            candidate[candidates[i]] = 0 ;
        }
        for (uint i=0;i<voters.length;i++) {
            //重置当前投票人
            voter[voters[i]] = false;
        }
        delete candidates;
        delete voters;
        return true;
    }
    
}