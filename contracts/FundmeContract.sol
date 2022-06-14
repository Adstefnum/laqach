//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;


 error NotOwner();
 error InsufficientFundAmount();

contract FundMe{
   uint256 constant MinimumLocalCurrencyFundAmount = 50*10e18;
   uint256 constant MinimumCyrptoCurrencyFundAmount = 50*10e18;
   uint256 constant MinimumWithdrawalAmount = 50*10e18;
   address immutable owner;

   
   mapping(address=>uint256) AddresstoFundedAmount;
   address[] Funders;
   
    constructor(){
        owner = msg.sender;
    }

    function ReceiveFunds() public payable{
        AddresstoFundedAmount[msg.sender] += msg.value;
        Funders.push(msg.sender);
    }
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

    modifier SufficientFundAmount{
        if(msg.value!=MinimumCyrptoCurrencyFundAmount) revert InsufficientFundAmount();
    }
}