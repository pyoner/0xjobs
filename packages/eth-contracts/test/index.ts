import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { Jobs } from "../typechain";

describe("Jobs", function () {
  let contract: Jobs;
  let owner: SignerWithAddress;
  let nonOwner: SignerWithAddress;

  before(async function () {
    [owner, nonOwner] = await ethers.getSigners();
    const Contract = await ethers.getContractFactory("Jobs");
    contract = await Contract.deploy();
    await contract.deployed();
  });

  it("#addJob should post a job", async function () {
    await expect(contract.addJob("<cid>"))
      .to.be.emit(contract, "JobAdded")
      .withArgs(owner.address, 0);
  });

  it("#removeJob should remove a job", async function () {
    const id = 0;
    await expect(contract.removeJob(id))
      .to.be.emit(contract, "JobRemoved")
      .withArgs(owner.address, id);
  });

  it("#removeJob shouldn't remove a job (check onlyOwner)", async function () {
    const c = await ethers.getContractAt("Jobs", contract.address, nonOwner);
    const id = 0;
    await expect(c.removeJob(id)).to.be.revertedWith(
      "Ownable: caller is not the owner"
    );
  });
});
