var SendEther = artifacts.require("./SendEther.sol");
var Donation = artifacts.require("./Donation.sol");

module.exports = function(deployer) {
  deployer.deploy(SendEther);
  deployer.deploy(Donation);

};
