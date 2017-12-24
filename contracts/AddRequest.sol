pragma solidity ^0.4.18;

contract AddRequest{
  struct RequestDoc {
		address owner;
		string title;
		string description;
    uint countEth;
	}

  uint public count = 0;

  RequestDoc[] public requestDocs;

  function addUser(string title, string description, uint countEth) public returns(address, string, string, uint){
    var requestDoc = RequestDoc(msg.sender, title, description, countEth); requestDocs.push(requestDoc);
    count++;
    return (requestDoc.owner, requestDoc.title, requestDoc.description, requestDoc.countEth);
  }

  function returnById(uint index) public constant returns(address, string, string, uint){
		return (requestDocs[index].owner, requestDocs[index].title, requestDocs[index].description, requestDocs[index].countEth);
  }

  function getLast() public returns(address, string, string, uint){
    count--;
		return (requestDocs[count].owner, requestDocs[count].title, requestDocs[count].description, requestDocs[count].countEth);
  }
}
