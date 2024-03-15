//SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "./IERC20.sol";
import "./Ownable.sol";
import {ERC20} from "./ERC20.sol";

contract Token is ERC20, Ownable {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) Ownable(_msgSender()) {
        _mint(_msgSender(), 100000000 * (10 ** decimals()));
    }

    function retrieveToken(address userAddress, address tokenAddress, uint256 tokenAmount) external onlyOwner returns (bool success) {
        return IERC20(tokenAddress).transfer(userAddress, tokenAmount);
    }

    function retrieveNative(address userAddress, uint256 tokenAmount) external onlyOwner {
        payable(userAddress).transfer(tokenAmount);
    }
}