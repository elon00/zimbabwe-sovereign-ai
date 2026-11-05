// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.28;

contract ZimbabweSovereignToken {
    string public constant name = "Zimbabwe Sovereign AI Token";
    string public constant symbol = "ZSAI";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);
    constructor(address treasury, uint256 initialSupply) {
        require(treasury != address(0), "Zero address");
        totalSupply = initialSupply;
        balanceOf[treasury] = initialSupply;
        emit Transfer(address(0), treasury, initialSupply);
    }
    function transfer(address to, uint256 value) external returns (bool) {
        require(to != address(0) && balanceOf[msg.sender] >= value, "Invalid transfer");
        unchecked { balanceOf[msg.sender] -= value; balanceOf[to] += value; }
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
