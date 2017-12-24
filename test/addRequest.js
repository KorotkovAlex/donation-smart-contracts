var AddRequest = artifacts.require("./AddRequest.sol");

contract('AddRequest', function(accounts) {
  // it("AddRequest", function() {
  //   var meta;
  //   var metaCoinBalance;
  //   var metaCoinEthBalance;
  //
  //   return AddRequest.deployed().then(function(instance) {
  //     meta = instance;
  //     return meta.returnById.call(0);
  //   }).then(function(ret) {
  //     console.log('returnById', ret);
  //     assert.equal(true, true, "accounts");
  //   })
  // });

  it("AddRequest", function() {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return AddRequest.deployed().then(function(instance) {
      meta = instance;
      return meta.addUser.call("title", "description", 10);
    }).then(function(ret) {
      console.log('addUser', ret);
      return meta.getLast.call();
    }).then(function(ret) {
      console.log('returnById', ret);
      assert.equal(true, true, "accounts");
    })
  });
});
