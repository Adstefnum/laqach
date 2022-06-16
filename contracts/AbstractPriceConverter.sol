//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract AbstractPriceConverter{
    //an interface might be needed
    function GetCryptoCurrencyPrice() public virtual {}
    function ConvertLocalCurrencyToUSD(uint256 LocalCurrencyAmount, string memory LocalCurrency) public virtual{}
    function ConvertCryptoCurrencyToUSD(uint256 CryptoAmount,string memory CryptoCurrency) public virtual{}
}
