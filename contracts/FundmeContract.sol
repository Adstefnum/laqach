//SPDX-license-Identifier:MIT

pragma solidity ^0.8.7;

contract FundMe{
    error NotOwner();

    address immutable owner;
    constructor(){
        owner = msg.sender
    }
    receive() external payable{}
    fallback() external payable{}
    modifier OnlyOwner{
        if(msg.sender!=owner){revert(NotOwner();)}
        _;
    }
}