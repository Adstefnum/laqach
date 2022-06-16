
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.7;

import "./AbstractPriceConverter.sol";
import "./EthToUSDConverter.sol";

contract CryptoConverterFactory{

    mapping(string=>address) ConvertersList;
    constructor(){

    ConvertersList["ETH"] = address(new EthToUSDConverter());
    } 
    function CreateConverter(string memory CryptoCurrency) public view returns(address){
        return ConvertersList[CryptoCurrency]; 
    }
}
