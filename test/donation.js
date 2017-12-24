var Donation = artifacts.require("./Donation.sol");
function getData(meta, i) {
  return meta.returnRecipientById.call(i).then(data => {
    console.log('data', data);
    return data;
  })
}
contract('Donation', function(accounts) {
  it("Donation", function() {
    var meta;
    var metaCoinBalance;
    var metaCoinEthBalance;

    return Donation.deployed().then(function(instance) {
      meta = instance;
      var dat = [];
      for(var i = 0; i < 4; i++) {
        dat[i] = getData(meta, i);
      }
      console.log('dat', dat);
      // return meta.returnRecipientById.call();
      assert.equal(true, true, "accounts");
    })
  });
});
