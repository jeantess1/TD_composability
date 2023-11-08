[My Answer bellow]
## TD Composability

For this TD, you will be evaluated in two ways:
- first by sending to the teacher your github repository because for all exercises, you must write some solidity code or use `cast` tool but not just call etherscan. Please complete `IStudentToken.sol` and `IStudentNft.sol` also.
- second by calling exercice functions when needing (variable `exerciceProgression` will be check for evaluation)


**Here are specifics details:**

Ex 1: Deploy an ERC20 contract (2pts)

Ex 2: Mint your ERC20 tokens by calling `ex2_mintStudentToken` (2pts)

Ex 3: Mint some EvaluatorTokens by calling `ex3_mintEvaluatorToken` (2 pts)

Ex 4: From your smart contract, you must call uniswap V3 smart contracts in order to swap EvaluatorToken <> RewardToken. Then call `ex4_checkRewardTokenBalance`  (2 pts)

Ex 5: You must send to the Evaluator smart contract some RewardToken by calling `ex5_checkRewardTokenBalance` (2 pts)

Ex 6: Create a liquidity pool on uniswap V3 between your ERC20 tokens and some WETH. You must use Uniswap smart contracts (2 pts)

Ex 7: Deploy an ERC721 (2 pts)

Ex 8: Mint some ERC721's by calling `ex8_mintNFT` (2 pts)

Ex 9: Ouch... my Evaluator contract is admin of your ERC721 token. He has full rights and you must call `ex9_burnNft` (1 pts)

Ex 10: Verify your smart contract on Etherscan and sourcify (1 pts)

Ex 11: Simply call `ex11_unlock_ethers` (2 pts)

BONUS:
- You succeed to make all the TD in one transaction (1 pt)
- You can automate some tasks (like deployment) in a makefile (1 pt)


-----------------------------------------
Deployed Addresses on goerli:
- [Evaluator contract](https://goerli.etherscan.io/address/0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE)
- [Reward contract](https://goerli.etherscan.io/address/0x56822085cf7C15219f6dC404Ba24749f08f34173)

-----------------------------------------
lancer Ubuntu 

clone le projet git

puis effectuer la commande “code .” pour lancer vscode

modifier clef priver etc dans le .env 

source .env pour mettre les variables d’environnement 

evaluator address : 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 

reward token address : 0x56822085cf7C15219f6dC404Ba24749f08f34173 

1 :

**deploy mon ERC20**

forge create --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY src/StudentToken.sol:
MyContract

**my contract token address : 0x885243a1bc862101665852c15e690f58e127b90f** 

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "registerStudentToken(address)" 0x885243a1bc862101665852c15e690f58e127b90f --rpc-url $
GOERLI_RPC_URL --private-key $PRIVATE_KEY

2 :

**Validation ex2**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex2_mintStudentToken()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

3 :

**Transfert des 20000000 tokens restant pour arriver à 30000000** 

cast send 0x0bF7823cD35D54FF1311Bd40382F678aC5319F57 "transfer(address,uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 20000000 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

**Validation ex3**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex3_mintEvaluatorToken()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

4 :

**Echange des Evaluator tokens contre 5 reward token via uniswapv3**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex4_checkRewardTokenBalance()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

5 :

Echange des Evaluatortokens contre 5 reward token via uniswapv3

**approve le contract à me prendre des rewards tokens**

cast send 0x56822085cf7C15219f6dC404Ba24749f08f34173 "approve(address,uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 1000000000000000000 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

7 :

**Deploy ERC721** 

forge create --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY src/StudentNft.sol:MyNft

**ERC721 address : 0x4A320C27F29521586622d360F1b2e2F29cFb3E9b**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "registerStudentNft(address)" 0x4A320C27F29521586622d360F1b2e2F29cFb3E9b --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

8 :

**Mint my ERC721 token**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex8_mintNFT()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

9 :

(Non fonctionnel je ne sais pas pourquoi)

modifier la fonction burn 

**mint le token 2** 

cast send 0x4A320C27F29521586622d360F1b2e2F29cFb3E9b "mint(uint256)" 2 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

Approve l’evaluator à burn mon ERC721

cast send 0x4A320C27F29521586622d360F1b2e2F29cFb3E9b "approve(address,uint256)" 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE 2 --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

**Validation ex9**

cast send 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE "ex9_burnNft()" --rpc-url $GOERLI_RPC_URL --private-key $PRIVATE_KEY

10 :

contract de mon nft (j’ai recommancé les questions donc nouvelle address NFT pour la suite )

**address de mon nouveau contract : 0x498ef11f181C87DEF2758eA09EEEf926e7B9d834** 

**Verfication contract ETHERSCAN**

forge verify-contract 0x498ef11f181C87DEF2758eA09EEEf926e7B9d834 MyNft --watch --chain-id 5

**pour sourcify la ligne de commande ne marche pas** 

forge verify-contract --verifier sourcify --verifier-url $VERIFIER_URL 0x498ef11f181C87DEF2758eA09EEEf926e7B9d834 MyNft

**j’ai donc fait directement sur le site**
