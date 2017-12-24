pragma solidity ^0.4.18;

//Sender
//Recipient
contract AddRequestSender{
  struct RequestDoc {
		address owner;
		string title;
		string description;
    uint countEth;
    uint countEthNow;
    bool helped;
	}

  struct Sender {
    address from;
    address to;
    uint countEth;
  }

  RequestDoc[] public requestDocs;
  Sender[] public senders;

  event LogDep (address sender,    uint amount, uint balance);
  event LogSent(address recipient, uint amount, uint balance);
  event LogErr (address recipient, uint amount, uint balance);

  function depositFunds() public payable returns(bool success) {
    LogDep(msg.sender, msg.value, this.balance);
    return true;
  }

  function countRequestDocs() public payable returns(uint) {
    return requestDocs.length;
  }

  function countSenders() public payable returns(uint) {
    return senders.length;
  }

  function addUser(string title, string description, uint countEth, uint countEthNow) public returns(address, string, string, uint, uint){
    var requestDoc = RequestDoc(msg.sender, title, description, countEth, countEthNow, false);
    requestDocs.push(requestDoc);
    return(requestDoc.owner, requestDoc.title, requestDoc.description, requestDoc.countEth, requestDoc.countEthNow);
  }

  function returnRequestById(uint index) public constant returns(address, string, string, uint, uint){
		return (requestDocs[index].owner, requestDocs[index].title, requestDocs[index].description, requestDocs[index].countEth, requestDocs[index].countEthNow);
  }

  function getRequestByKey(address key) public constant returns(uint, address, string, string, uint, uint){
		for (uint i = 0; i < requestDocs.length; i++ ){
			if(requestDocs[i].owner == key) {
        return (i, requestDocs[i].owner, requestDocs[i].title, requestDocs[i].description, requestDocs[i].countEth, requestDocs[i].countEthNow);
			}
		}
		return (0, 0x00,"","", 0,0);
  }

  function getRequestByKeySt(address key) public constant returns(RequestDoc){
		for (uint i = 0; i < requestDocs.length; i++ ){
			if(requestDocs[i].owner == key) {
        return (requestDocs[i]);
			}
		}
    var requestDoc = RequestDoc(0x00,"","", 0,0, false);

		return requestDoc;
  }

  function changeRequestByKey(address key, uint countEth) public payable returns(bool success){
		for (uint i = 0; i < requestDocs.length; i++ ){
			if(requestDocs[i].owner == key) {
        requestDocs[i].countEthNow += countEth;
        return true;
			}
		}
		return false;
  }

  function changeHelpedRequestByKey(address key) public payable returns(bool success){
		for (uint i = 0; i < requestDocs.length; i++ ){
			if(requestDocs[i].owner == key) {
        requestDocs[i].helped = true;
        return true;
			}
		}
		return false;
  }

  function checkBalanceRequest(address user) public payable returns(bool success){
    RequestDoc memory requestDoc = getRequestByKeySt(user);
    if (requestDoc.countEth <= requestDoc.countEthNow) {
      LogSent(user, requestDoc.countEthNow, this.balance);
      changeHelpedRequestByKey(user);
      return true;
    }
    return false;
  }

  function addSender(address to) public payable returns(bool success){
    if(depositFunds()){
      var sender = Sender(msg.sender, to, msg.value);
      senders.push(sender);
      changeRequestByKey(to, msg.value);
      checkBalanceRequest(to);
      return true;
    }
    return false;
  }

  function returnSenderById(uint index) public constant returns(address, address, uint){
		return(senders[index].from, senders[index].to, senders[index].countEth);
  }
}
