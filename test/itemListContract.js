var ItemListContract = artifacts.require("./ItemListContract.sol");

contract('ItemListContract', function(accounts) {
  it("test1", function() {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return ItemListContract.deployed().then(function(instance) {
      meta = instance;
      console.log('accounts', accounts[0]);
      return meta.addItem.call(10);
    }).then(function(ret) {

      console.log('ret', ret);
      return meta.getItem.call(0);
    }).then(function(ret) {
      console.log('getItem', ret);
      assert.equal(true, true, "accounts");
    })
  });
});
