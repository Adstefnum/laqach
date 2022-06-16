//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract AbstractPriceConverter{
    function GetCryptoPrice(AggregatorV3Interface PriceFeed) public virtual view returns(uint256)  {}
    function ConvertCryptoToUSD(uint256 CryptoAmount,AggregatorV3Interface PriceFeed) public virtual view returns(uint256) {}
}
