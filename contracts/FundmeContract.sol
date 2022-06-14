//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;


 error NotOwner();

contract FundMe{
   uint256 constant MinimumLocalCurrencyFundAmount = 50*10e18;
   uint256 constant MinimumCyrptoCurrencyFundAmount = 50*10e18;
   uint256 constant MinimumWithdrawalAmount = 50*10e18;
   address immutable owner;

   
   mapping(address=>uint256) AddresstoFundedAmount;
   
   

    
    constructor(){
        owner = msg.sender;
    }

    function ReceiveFunds() public payable{}
    function WithdrawFunds() public OnlyOwner{}
    receive() external payable{
        ReceiveFunds();
    }
    fallback() external payable{
        ReceiveFunds();
    }
    modifier OnlyOwner{
        if(msg.sender!=owner) revert NotOwner();
        _;
    }
}