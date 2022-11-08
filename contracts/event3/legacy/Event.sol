// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import '../ERC721AUpgradeable.sol';

contract Event is ERC721AUpgradeable {
    // uint256 private _tokensCounter;
    // string  private _eventName;
    // address private _owner;
    // mapping (uint256 => string) private _tokens;
    // mapping (uint256 => string) private _tokenUris;
    // mapping (uint256 => uint256) private _priceById;
    // mapping (uint256 => uint256) private  _supplyById;
    // mapping (uint256 => uint256) private _mintedById;
    // event newTokenAdded(
    //     uint256 eventId,
    //     uint256 supply,
    //     uint256 price,
    //     address owner,
    //     string tokenUri
    // );
    // //To use proxy, i have to delete the constructor and add initializer
    // constructor(string memory eventName, address owner) ERC1155(eventName){
    //     _tokensCounter = 0;
    //     _eventName = eventName;
    //     _owner = owner;
    // }
    // modifier onlyOwner(){
    //     require(msg.sender == _owner);
    //     _;
    // }
    // function addNewToken(string memory tokenUri, uint256 tokenPrice, uint256 tokenSupply) public onlyOwner {
    //     _tokens[_tokensCounter] = tokenUri;
    //     _priceById[_tokensCounter] = tokenPrice;
    //     _supplyById[_tokensCounter] = tokenSupply;
    //     _tokenUris[_tokensCounter] = tokenUri;
    //     emit newTokenAdded(_tokensCounter, tokenSupply, tokenPrice, msg.sender, tokenUri);
    //     _tokensCounter++;
    // }
    // function mint(uint256 tokenId, uint256 amount) public payable{
    //     require(msg.value >= _priceById[tokenId] * amount, "Not enough bucks for mint");
    //     require(_mintedById[tokenId] + amount <= _supplyById[tokenId], "Insufficient amount of tokens");
    //     require(tokenId >= 0, "Please submit a valid Id");
    //     _mint(msg.sender, tokenId, amount, "");
    //     _mintedById[tokenId] += amount;
    // }
    // function getName() public view returns(string memory) {
    //     return _eventName;
    // }
    // function uri(uint256 tokenId) override public view returns (string memory) {
    //     return(_tokenUris[tokenId]);
    // }
    // function setTokenUri(uint256 tokenId, string memory tokenUri) public onlyOwner {
    //     _tokenUris[tokenId] = tokenUri;
    // }
    // function withdrawMoney() external onlyOwner nonReentrant {
    //     (bool success, ) = msg.sender.call{value: address(this).balance}("");
    //     require(success, "Transfer failed.");
    // }
    // function destroyContract(address payable addressToSendValue) public onlyOwner {
    //     selfdestruct(addressToSendValue);
    // }
    /*
        TODO :

        1.- Disable Transfers
        2.- Royalties distribution
        3.- Drops for holders 
        4.- Burn Items
    */
}
