//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./mocks/mock_EthToUSDConverter.sol";
import "./EthToUSDConverter.sol";

 error NotOwner();
 error InsufficientFundAmount();
 error InsufficientBalance();

contract FundMe{
   uint256 constant public MinimumUSDFundAmount = 50*10**18;
   uint256 constant private MinimumWithdrawalBalance = 50*10**18;
   address immutable private Owner;

   AggregatorV3Interface private PriceFeed;
   EthToUSDConverter PriceConverter = new EthToUSDConverter();

   mapping(address=>uint256) AddressToFundedAmount;
   address[] Funders;


    constructor(address PriceFeedAddress){
        Owner = msg.sender;
        PriceFeed = AggregatorV3Interface(PriceFeedAddress);
    }
    
    function ReceiveFunds() public IfSufficientFundAmount payable{

        AddressToFundedAmount[msg.sender] += msg.value;
        Funders.push(msg.sender);
    }
    function WithdrawFunds() public OnlyOwner payable IfSufficientBalance{
        for(uint256 FunderIndex;FunderIndex<Funders.length;FunderIndex++){
           address Funder =  Funders[FunderIndex];
           AddressToFundedAmount[Funder] = 0;
        }
        Funders = new address[](0);
        (bool Success,)  = Owner.call{value:address(this).balance}("");
        require(Success);
    }

    function GetAccountBalance() public view OnlyOwner returns(uint256){
        return address(this).balance;
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
        if(PriceConverter.ConvertCryptoToUSD(msg.value,PriceFeed)<MinimumUSDFundAmount) revert InsufficientFundAmount();
        _;
    }
    modifier IfSufficientBalance{
        if(address(this).balance<MinimumWithdrawalBalance) revert InsufficientBalance();
        _;
    }
}
