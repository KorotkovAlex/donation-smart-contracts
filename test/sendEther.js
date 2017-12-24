var SendEther = artifacts.require("./SendEther.sol");

contract('SendEther', function(accounts) {
  it("SendEther", function() {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return SendEther.deployed().then(function(instance) {
      meta = instance;
      return meta.add.call("10");
    }).then(function(ret) {

      console.log('ret', ret);
      return meta.get_address.call();
    }).then(function(ret) {
      console.log('get_address', ret);
      assert.equal(true, true, "accounts");
    })
  });
});
