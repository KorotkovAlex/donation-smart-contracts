pragma solidity ^0.4.18;

contract Documents {
	struct Document {
		address owner;
		string document;
		string FIO;
	}
	Document[] public documents;
	//mapping (uint => Document) public documents;
	//mapping (string => address) public owners; //номер паспорта к адресу

	//Transactions
	function addDocument(string data, string fio) public {
		documents.push(Document(msg.sender, data, fio));
	}

	//Functions
	function getDocById(uint id) public constant returns
		(uint, 		//id в мапке
		address, //владелец
		string, //содержимое
		string) //фио
	{
		return (id, documents[id].owner, documents[id].document, documents[id].FIO);
	}

	function getDocumentsNumber() public constant returns (uint) {
		return documents.length;
	}

	function getThisAddresDocNumber() constant public returns (uint) {
		uint result = 0;
		for (uint i = 0; i < documents.length; i++ ){
			if(documents[i].owner == msg.sender) {
				result++;
			}
		}
		return result;
	}

	function getThisAddresDocById(uint id) constant public returns (
	    uint, 	//id в массиве
		address, //владелец
		string, //содержимое
		string) //фио
	{
		uint j = 0;
		for (uint i = 0; i < documents.length; i++ ){
			if(documents[i].owner == msg.sender) {
				if (j == id) return (i, documents[i].owner, documents[i].document, documents[i].FIO);
				else j++;
			}
		}
		return (0,0x00,"","");
	}

}
