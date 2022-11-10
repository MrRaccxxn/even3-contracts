// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IEvent {
    struct TicketInfo {
        uint256 tokenId;
        address owner;
    }

    struct TicketType {
        uint256 ticketTypeId;
        string title;
        uint256 date;
        uint256 ticketLimit;
        uint256 ticketCounter;
        mapping(uint256 => TicketInfo) tickets;
    }

    function mint(uint256 quantity, uint32 ticketTypeId) external payable;
    function adminMint(uint256 quantity) external payable;

    function createNewTicketType(
        string memory title,
        uint256 date,
        uint256 ticketLimit
    ) external;
}
