var MetaCoin = artifacts.require("./MetaCoin.sol");
var SendEtherToAccaunt = artifacts.require("./SendEtherToAccaunt.sol");
var AddRequest = artifacts.require("./AddRequest.sol");
var SendEther = artifacts.require("./SendEther.sol");
var Donation = artifacts.require("./Donation.sol");

module.exports = function(deployer) {
  // deployer.link(MetaCoin, SendEtherToAccaunt);
  deployer.deploy(MetaCoin);
  deployer.deploy(SendEtherToAccaunt);
  deployer.deploy(AddRequest);
  deployer.deploy(SendEther);
  deployer.deploy(Donation);

};
