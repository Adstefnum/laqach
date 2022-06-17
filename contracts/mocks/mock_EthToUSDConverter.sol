//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "../AbstractPriceConverter.sol";
contract MockEthToUSDConverter is AbstractPriceConverter{
    function GetCryptoPrice(AggregatorV3Interface PriceFeed) public override view returns(uint256)   {
        (,int256 CryptoPrice,,,) = PriceFeed.latestRoundData();
        CryptoPrice = 3000*10e18;
        return uint256(CryptoPrice);
    }
    function ConvertCryptoToUSD(uint256 CryptoAmount,AggregatorV3Interface PriceFeed) public override view returns(uint256)  {
        uint256 EthPrice = GetCryptoPrice(PriceFeed);
        uint256 EthAmountInUSD = (CryptoAmount*EthPrice) / 10e18;
        return EthAmountInUSD;
    }
}
