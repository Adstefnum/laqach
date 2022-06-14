//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

//add chainlink datafeeds
contract AbstractPriceConverter{
    //an interface might be needed
    function GetCryptoCurrencyPrice() public virtual {}
    function ConvertLocalCurrencyToUSD(uint256 LocalCurrencyAmount, string memory LocalCurrency) public virtual{}
    function ConvertCryptoCurrencyToUSD(uint256 CryptoAmount,string memory CryptoCurrency) public virtual{}
}
