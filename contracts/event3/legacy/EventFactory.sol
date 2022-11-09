// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.4;
// import './Event.sol';

// contract EventFactory {
//     uint256 counter;
//     Event public eventContract;

//     constructor() {
//         counter = 0;
//     }

//     mapping(uint256 => eventInfo) _events;

//     struct eventInfo {
//         uint256 eventId;
//         address owner;
//         string eventName;
//         address eventAddress;
//     }

//     event newEventCreated(uint256 eventId, address owner, string eventName, address eventAddress);

//     function createNewEvent(string memory eventName) public returns (address) {
//         address eventAddress = address(new Event(eventName, msg.sender));
//         eventInfo storage _eventInfo = _events[counter];
//         _eventInfo.eventId = counter;
//         _eventInfo.owner = msg.sender;
//         _eventInfo.eventName = eventName;
//         _eventInfo.eventAddress = eventAddress;

//         emit newEventCreated(counter, msg.sender, eventName, eventAddress);
//         counter++;

//         return eventAddress;
//     }

//     function getEventById(uint256 eventId)
//         public
//         view
//         returns (
//             uint256,
//             address,
//             string memory,
//             address
//         )
//     {
//         require(eventId >= 0 && eventId < counter, 'Please submit a valid Event Id');
//         eventInfo storage _eventInfo = _events[eventId];
//         return (_eventInfo.eventId, _eventInfo.owner, _eventInfo.eventName, _eventInfo.eventAddress);
//     }
// }
