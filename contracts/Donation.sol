pragma solidity ^0.4.18;

contract Donation{
  struct Recipient {
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

  Recipient[] public recipients;
  Sender[] public senders;

  /*mapping (address => Recipient) recipients2;*/
  /*address[] public recipients2;*/

  event LogDep (address sender,    uint amount, uint balance);
  event LogSent(address recipient, uint amount, uint balance);
  event LogErr (address recipient, uint amount, uint balance);

  function depositFunds() public payable returns(bool success) {
    LogDep(msg.sender, msg.value, this.balance);

    return true;
  }

  //--------Count

  function countRecipients() public payable returns(uint) {
    return recipients.length;
  }

  function countSenders() public payable returns(uint) {
    return senders.length;
  }

  //-------Returns

  function returnRecipientById(uint index) public constant returns(address, string, string, uint, uint, bool){
		return (recipients[index].owner, recipients[index].title, recipients[index].description, recipients[index].countEth, recipients[index].countEthNow, recipients[index].helped);
  }

  function returnRecipientByKey(address key) public constant returns(uint, address, string, string, uint, uint, bool){
		for (uint i = 0; i < recipients.length; i++ ){
			if(recipients[i].owner == key) {
        return (i, recipients[i].owner, recipients[i].title, recipients[i].description, recipients[i].countEth, recipients[i].countEthNow, recipients[i].helped);
			}
		}

		return (0, 0x00,"","", 0,0, false);
  }



  function returnRecipientByKeySt(address key) public constant returns(Recipient){
		for (uint i = 0; i < recipients.length; i++ ){
			if(recipients[i].owner == key) {
        return (recipients[i]);
			}
		}
    var requestDoc = Recipient(0x00,"","", 0,0, false);

		return requestDoc;
  }


  function returnSenderByKey(address key) public constant returns(Sender){
    for (uint i = 0; i < senders.length; i++){
			if(senders[i].from == key) {
        return (senders[i]);
			}
		}
    var sender = Sender(0x00,0x00, 0);

		return sender;
  }

  //------ Change

  function changeRecipientByKey(address key, uint countEth, bool helped) public payable returns(bool success){
    for (uint i = 0; i < recipients.length; i++ ){
      if(recipients[i].owner == key) {
        recipients[i].countEthNow += countEth;
        recipients[i].helped = helped;

        return true;
      }
    }

    return false;
  }

  //------Check

  function checkBalanceRecipient(address to) public payable returns(bool success){
    Recipient memory requestDoc = returnRecipientByKeySt(to);
    if (requestDoc.countEth <= requestDoc.countEthNow) {
      to.transfer(requestDoc.countEth);
      LogSent(to, requestDoc.countEthNow, this.balance);
      changeRecipientByKey(to, 0, true);

      return true;
    }

    return false;
  }

  function chakeRecipientByKey(address key) public constant returns(bool){
		for (uint i = 0; i < recipients.length; i++ ){
      if(recipients[i].owner == key && !recipients[i].helped) {
        return false;
			}
		}
    return true;
  }

  //------Adds

  function addUser(string title, string description, uint countEth, uint countEthNow) public returns(address, string, string, uint, uint){
    var requestDoc = Recipient(msg.sender, title, description, countEth, countEthNow, false);
    if(chakeRecipientByKey(msg.sender)){
      recipients.push(requestDoc);
      return(requestDoc.owner, requestDoc.title, requestDoc.description, requestDoc.countEth, requestDoc.countEthNow);
    }

    requestDoc = Recipient(0x00,"","", 0,0, false);

    return(requestDoc.owner, requestDoc.title, requestDoc.description, requestDoc.countEth, requestDoc.countEthNow);
  }

  function addSender(address to) public payable returns(bool success){
    if(depositFunds()){
      var sender = Sender(msg.sender, to, msg.value);
      senders.push(sender);
      changeRecipientByKey(to, msg.value, false);
      checkBalanceRecipient(to);

      return true;
    }

    return false;
  }
}
