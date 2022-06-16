//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;


 error NotOwner();
 error InsufficientFundAmount();
 error InsufficientBalance();

contract FundMe{
   uint256 constant public MinimumUSDFundAmount = 50*10e18;
   uint256 constant private MinimumWithdrawalBalance = 50*10e18;
   address immutable private Owner;

   
   mapping(address=>uint256) AddressToFundedAmount;
   address[] Funders;
   
    constructor(){
        Owner = msg.sender;
    }

    function ReceiveFunds() public payable IfSufficientFundAmount{

        AddressToFundedAmount[msg.sender] += msg.value;
        Funders.push(msg.sender);
    }
    function WithdrawFunds() public OnlyOwner IfSufficientBalance{
        for(uint256 FunderIndex;FunderIndex<Funders.length;FunderIndex++){
           address Funder =  Funders[FunderIndex];
           AddressToFundedAmount[Funder] = 0;
        }
        Funders = new address[](0);
        (bool Success,)  = Owner.call{value:address(this).balance}("");
        require(Success);
    }

    receive() external payable{
        ReceiveFunds();
    }

    fallback() external payable{
        ReceiveFunds();
    }

    modifier OnlyOwner{
        if(msg.sender!=Owner) revert NotOwner();
        _;
    }

    modifier IfSufficientFundAmount{
        if(msg.value!=MinimumUSDFundAmount) revert InsufficientFundAmount();
        _;
    }
    modifier IfSufficientBalance{
        if(address(this).balance!=MinimumWithdrawalBalance) revert InsufficientBalance();
        _;
    }
}
