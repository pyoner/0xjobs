import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { JobPosts } from "../typechain";

describe("JobPosts", function () {
  let contract: JobPosts;
  let signers: SignerWithAddress[];
  let defaultSigner: SignerWithAddress;

  before(async function () {
    signers = await ethers.getSigners();
    defaultSigner = signers[0];
    const Contract = await ethers.getContractFactory("JobPosts");
    contract = await Contract.deploy();
    await contract.deployed();
  });

  it("#postJob should post a job", async function () {
    await expect(contract.postJob("<cid>"))
      .to.emit(contract, "JobPosted")
      .withArgs(defaultSigner.address, 0);
  });

  it("#removeJob should remove a job", async function () {
    const id = 0;
    await expect(contract.removeJob(id))
      .to.emit(contract, "JobRemoved")
      .withArgs(defaultSigner.address, id);
  });
});
