// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a-upgradeable/contracts/ERC721AUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../interfaces/IEvent.sol";

contract EventFacet is IEvent, ERC721AUpgradeable, OwnableUpgradeable {
    string private _eventName;
    string private _eventSymbol;
    uint32 private _ticketTypeCounter;
    mapping(uint32 => TicketType) eventTicketTypes;

    event newTicketTypeAdded(uint256 ticketTypeId, string title, uint256 date, uint256 ticketLimit, uint256 ticketCounter);
    event newTicketMinted(uint256 ticketTypeId, uint256 quantity, address ticketOwner);

    function initialize() public initializerERC721A initializer {
        __ERC721A_init(_eventName, _eventSymbol);
        __Ownable_init();
    }

    function mint(uint256 quantity, uint32 ticketTypeId) external payable {
        require(ticketTypeId <= _ticketTypeCounter, "Ticket Type was not found");
        require(
            eventTicketTypes[_ticketTypeCounter].ticketCounter <= eventTicketTypes[_ticketTypeCounter].ticketLimit,
            "This ticket type had reached the limit of mints"
        );

        _mint(msg.sender, quantity);
        for (uint32 index = 0; index < quantity; index++) {
            TicketInfo memory ticketInfo = TicketInfo({tokenId: eventTicketTypes[ticketTypeId].ticketCounter++, owner: msg.sender});
            eventTicketTypes[ticketTypeId].tickets[eventTicketTypes[ticketTypeId].ticketCounter] = ticketInfo;
        }

        emit newTicketMinted({ticketTypeId: ticketTypeId, quantity: quantity, ticketOwner: msg.sender});
    }

    function adminMint(uint256 quantity) external payable onlyOwner {
        _mint(msg.sender, quantity);
    }

    function createNewTicketType(
        string memory title,
        uint256 date,
        uint256 ticketLimit
    ) external onlyOwner {
        TicketType storage ticketType = eventTicketTypes[_ticketTypeCounter];
        ticketType.ticketTypeId = _ticketTypeCounter;
        ticketType.title = title;
        ticketType.date = date;
        ticketType.ticketLimit = ticketLimit;
        _ticketTypeCounter++;
    }
}

//TODO : limit minting of tickets by the same address
