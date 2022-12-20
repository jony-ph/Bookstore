// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract Bookstore is ERC1155 {
    uint256 public tokenCounter;

    // El token URI es el link IPFS para los metadatos relacionados
    // con el ID del token creado de la librería NFT
    constructor() ERC1155("https://ipfs.io/ipfs/QmRXWdKuthnpBLk6weZAbak8oMPPQkM2nNxKrpuC8SiajR?filename=sample.json"){ 
        tokenCounter = 0;
    }

    struct BookDetails {
        address author;
        string title;
        uint256 copies;
    }

    mapping(uint256 => BookDetails) private _BookDetails;

    // Crear un nuevo token
    function publish(string memory _title, uint256 _copies) public {
        uint256 newTokenID = tokenCounter + 1;

        _BookDetails[newTokenID].author = msg.sender;
        _BookDetails[newTokenID].title = _title;
        _BookDetails[newTokenID].copies = _copies;

        // Propietario, TokenID, # Copias, Callback con los datos
        _mint(msg.sender, newTokenID, _copies, "");

        tokenCounter++;

    }

    function AuthorBook(uint256 _BookID) public view returns(address) {
        return (_BookDetails[_BookID].author);
    }

    function TitleBook(uint256 _BookID) public view returns(string memory) {
        return (_BookDetails[_BookID].title);
    }

    function CopiesBook(uint256 _BookID) public view returns(uint256) {
        return (_BookDetails[_BookID].copies);
    }

    function Approve(address _operator) public {
        require(_operator != msg.sender);
        setApprovalForAll(_operator, true);
    }

    function purchaseFromAuthor(uint256 _tokenID, uint256 _copies) public {
        address author = _BookDetails[_tokenID].author;
        address buyer = msg.sender;

        safeTransferFrom(author, buyer,_tokenID, _copies, "");
    }
}