// var SendEtherToAccaunt = artifacts.require("./SendEtherToAccaunt.sol");
//
// contract('SendEtherToAccaunt', function(accounts) {
//   it("test1", function() {
//     var meta;
//     var metaCoinBalance;
//     var metaCoinEthBalance;
//
//     return SendEtherToAccaunt.deployed().then(function(instance) {
//       meta = instance;
//       console.log('accounts', accounts[0]);
//       return meta.return1.call(accounts[0],"title", "description", 10);
//     }).then(function(ret) {
//       console.log('ret', ret);
//       assert.deepEqual(ret,
//         [
//           '0x627306090abab3a6e1400e9345bc60c78a8bef57',
//           'title',
//           'description',
//           { s: 1, e: 1, c: [ 10 ] }
//         ], "accounts");
//     })
//   });
//
//   it("addUser", function() {
//     var meta;
//     var metaCoinBalance;
//     var metaCoinEthBalance;
//
//     return SendEtherToAccaunt.deployed().then(function(instance) {
//       meta = instance;
//       return meta.addUser.call(accounts[0],"title", "description", 10);
//     }).then(function(ret) {
//       console.log('ret', ret);
//       return meta.addUser.call(accounts[1],"title", "description", 10);
//     }).then(function(ret) {
//       console.log('ret', ret);
//       console.log('meta.getRequestDocsNumber.call();', meta.getRequestDocsNumber.call());
// //
//       return meta.getRequestDoc.call();
//
//     }).then(function(count) {
//       console.log("count", count);
//       assert.equal(count, 1, "accounts");
//     })
//   });
// // });
