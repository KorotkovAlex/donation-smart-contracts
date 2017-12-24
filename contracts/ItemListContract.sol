pragma solidity ^0.4.18;

contract ItemListContract {
    struct item {
        uint ivalue;
    }

    uint itemCount;
    mapping(uint => item) itemList;
    item[] itemArray;

    function ItemListContract() public {
        log0('hi');
    }

    function addItem(uint val) public {
        var itemnew = item(val);
        // log0(itemnew);
        itemArray.push(itemnew);
    }

    function countItemList() constant public returns (uint count) {
        return itemCount;
    }

    function removeItem(uint code) public{
        delete itemList[code];
        itemCount--;
    }

    function getItem(uint code) constant public returns (uint val) {
        return (itemList[code].ivalue);
    }
}
