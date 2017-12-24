pragma solidity ^0.4.18;
pragma experimental ABIEncoderV2;

contract SendEtherToAccaunt{
  struct RequestDoc {
		address owner;
		string title;
		string description;
    uint countEth;
	}

  RequestDoc[] public requestDocs;
  uint[10] myArray;
  /*mapping (uint => myArray) funders;*/
  uint numRequestDoc;
  /*mapping (uint => RequestDoc) requestDocs;*/

  event LogDep (address sender,    uint amount, uint balance);
  event LogSent(address recipient, uint amount, uint balance);
  event LogErr (address recipient, uint amount, uint balance);

  function addUser(address account,string title, string description, uint countEth) public {
    requestDocs.push(RequestDoc(account, title, description, countEth));
  }

  function return1(
    address account,
    string title,
    string description,
    uint countEth) public returns (address ,string , string , uint ){
    return (account, title,  description,  countEth);
  }

  function getRequestDocsNumber() public constant returns (uint) {
    return numRequestDoc;
  }

  function getRequestDoc() public returns (address[], string[], string[], uint[]){
        address[] memory owner1 = new address[](1);
        string[] memory title1 = new string[](1);
        string[] memory description1 = new string[](1);
        uint[] memory countEth1 = new uint[](1);

        for (uint i = 0; i < 1; i++) {
            RequestDoc storage requestDoc = requestDocs[i];
            owner1[i] = requestDoc.owner;
            title1[i] = requestDoc.title;
            description1[i] = requestDoc.description;
            countEth1[i] = requestDoc.countEth;
        }

        return (owner1, title1, description1, countEth1);
    }

  /*function SendEtherToAccaunt() public {
    user=msg.sender;
  }*/

  function depositFunds() public payable returns(bool success) {
    LogDep(msg.sender, msg.value, this.balance);
    return true;
  }

  /*function addUser(bytes32 _name) public {
    name[i]=_name;
    customer[i]=msg.sender;
    i++;
  }*/

  /*function getRequestDoc() constant public returns(RequestDoc[]){
    return requestDocs;
  }*/

  function getRequestDocById(uint id) public constant returns
    ( 		//id в мапке
    address, //владелец
    string, //содержимое
    string,
    uint
    ) //фио
  {
    return (requestDocs[id].owner, requestDocs[id].title, requestDocs[id].description, requestDocs[id].countEth);
  }



  /*function reward() public {

    for ( uint k = 0; k<10; k++) {
        if(customer[k].send(10)) {
            LogSent(customer[k], 1, this.balance);
        } else {
            LogErr(customer[k], 1, this.balance);
        }
    }
  }*/
}

// План проекта
// Пользователь добавляет свой аккаунт в список +  title + description + количество нужных денег.
// Будет функция для вывода списка нуждающих
// Функция поиска человека по id/PrivateKey
// Функция для добавления количества эфира + кому и передача эфира в кошелек ethera
// Функция для проверки , хватает ли денег для пожертвования
//
