// Pass the repo name
const recipe = "minting-nfts-in-a-set";

//Generate paths of each code file to render
const contractPath = `${recipe}/cadence/contract.cdc`;
const transactionPath = `${recipe}/cadence/transaction.cdc`;

//Generate paths of each explanation file to render
const smartContractExplanationPath = `${recipe}/explanations/contract.txt`;
const transactionExplanationPath = `${recipe}/explanations/transaction.txt`;

export const mintingNftsInASet = {
  slug: recipe,
  title: "Minting NFTs in a Set",
  description: "",
  createdAt: Date(2022, 9, 14),
  author: "Flow Blockchain",
  playgroundLink:
    "https://play.onflow.org/a7d190b6-e0f1-4acc-b34c-f37b39fbab33?type=tx&id=d6734d42-6a63-40cc-a8f9-529421e9952d&storage=none",
  excerpt:
    "You've created your set in your series and now you're ready to mint your NFTS. This code shows you how to do that.",
  smartContractCode: contractPath,
  smartContractExplanation: smartContractExplanationPath,
  transactionCode: transactionPath,
  transactionExplanation: transactionExplanationPath,
};
