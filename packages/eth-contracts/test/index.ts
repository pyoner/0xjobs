import { expect } from "chai";
import { ethers } from "hardhat";
import { JobPosts } from "../typechain";

describe("JobPosts", function () {
  let contract: JobPosts;

  before(async function () {
    const Contract = await ethers.getContractFactory("JobPosts");
    contract = await Contract.deploy();
    await contract.deployed();
  });

  it("#postJob should post a job", async function () {
    expect(await contract.postJob("<cid>")).to.emit(contract, "JobPosted");
  });

  it("#removeJob should remove a job", async function () {
    expect(await contract.removeJob(0)).to.emit(contract, "JobRemoved");
  });
});
