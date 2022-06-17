import { expect } from "chai";
import { ethers } from "hardhat";

describe("JobPosts", function () {
  it("Should post a job", async function () {
    const JobPosts = await ethers.getContractFactory("JobPosts");
    const jobPosts = await JobPosts.deploy();
    await jobPosts.deployed();

    expect(await jobPosts.postJob("<cid>")).to.emit(jobPosts, "JobPosted");
  });
});
