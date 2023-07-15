const DigitalPicture = artifacts.require("DigitalPicture");

contract("DigitalPicture", async function (accounts) {
  const [owner] = accounts;

  // 각각 테스트 케이스를 실행하기 전 무조건 실행되는 코드
  beforeEach(async function () {
    this.token = await DigitalPicture.new();
  });

  it("publish item", async function () {
    const tokenId = await this.token.publishItem(owner, "http://dev.sample.com/a/b/abc.jpg");

    console.log(tokenId);
  });
});
