// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "./IStudentNft.sol";
contract MyNft is ERC721,IStudentNft {
	constructor() ERC721("JeanNft", "jtsd") {

	}
	
	function mint(uint256 tokenIdToMint) external {
        
        _mint(msg.sender, tokenIdToMint);
        
        
        
    }

	function burn(uint256 tokenIdToBurn) external
	{
		
		transferFrom(0xCC5b06709D8D55b16F9c54B0EB2b7b2b18070e46, address(0), tokenIdToBurn);
	}
}
