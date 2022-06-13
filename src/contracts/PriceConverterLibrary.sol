//SPDX-license-Identifier:MIT

pragma solidity 0.8.8

//add chainlink datafeeds
library PriceConverter{
    //an interface might be needed
    function GetCryptoCurrencyPrice() internal{}
    function ConvertLocalCurrencyToUSD(uint256 LocalCurrencyAmount, string memory LocalCurrency){}
    function ConvertCryptoCurrencyToUSD(uint256 CryptoAmount,string memory CryptoCurrency) internal{}
}
