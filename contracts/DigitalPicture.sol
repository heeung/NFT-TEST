// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// import "../@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol"; //순차 적인 발급을 위한.

contract DigitalPicture is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  constructor() ERC721("DigitalPicture", "NDP") {}

  // public 으로 해야만 web3.js 에서 이용할 수 있다.
  // address : 지갑 주소 정보
  // NFT 를 발행 할때마다 increment 되면서 순차적으로 키 생성
  function publishItem(address creator, string memory tokenURI) public returns (uint256){
    _tokenIds.increment(); // 1

    uint256 newTokenId = _tokenIds.current();

    // 해당 지갑 주소를 가지고 있는 사람한테 NFT 토큰 한개를 전달해주는 함수
    _mint(creator, newTokenId);
    // tokenURI : 창작자의 그림이 저장되어있는 특정 위치
    _setTokenURI(newTokenId, tokenURI);

    return newTokenId;
  }
}
