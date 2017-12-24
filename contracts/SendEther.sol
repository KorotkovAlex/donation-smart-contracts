pragma solidity ^0.4.18;


contract SendEther{

  address public user;
  bytes32[10] name;
  address[10] customer;
  uint public i=0;

  event LogDep (address sender,    uint amount, uint balance);
  event LogSent(address recipient, uint amount, uint balance);
  event LogErr (address recipient, uint amount, uint balance);

  function SendEther() public {

    user=msg.sender;
  }

  function depositFunds() public payable returns(bool success) {
    LogDep(msg.sender, msg.value, this.balance);
    return true;
  }

  function add(bytes32 _name) public {
    name[i]=_name;
    customer[i]=msg.sender;
    i++;
  }

  function get_address() constant public returns(address[10]){
    return customer;
  }

  function reward() public {

    for ( uint k = 0; k<10; k++) {
        if(customer[k].send(10)) {
            LogSent(customer[k], 1, this.balance);
        } else {
            LogErr(customer[k], 1, this.balance);
        }
    }
  }
}
