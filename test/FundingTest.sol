pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "../contracts/Funding.sol";
import "truffle/DeployedAddresses.sol";

contract FundingTest {
  uint public initialBalance = 10 ether;
  
  function testAcceptingDonations() public {
        Funding funding = new Funding();
        Assert.equal(funding.raised(),0, "Initial raised amount is different from 0");

        funding.donate.value(10 finney)();
        funding.donate.value(20 finney)();
        Assert.equal(funding.raised(),30 finney,"Raised amount is different from sum of donations");
    }

  function testSettingAnOwnerOfDeployedContract() public {
          Funding funding = Funding(DeployedAddresses.Funding());
          Assert.equal(funding.owner(), msg.sender,"The owner is different from the deployed");
      }

  function testSettingAnOwnerDuringCreation() public {
          Funding funding = new Funding();
          Assert.equal(funding.owner(), address(this), "The owner is different from the deployer");
      }
}
