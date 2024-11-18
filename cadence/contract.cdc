// More code from Series resource above...

access(all)
fun mintSetAndSeriesNFT(
    recipient: &{NonFungibleToken.CollectionPublic},
    tokenId: UInt64,
    setId: UInt32
) {
    pre {
        // Validate that the set exists
        self.numberEditionsMintedPerSet[setId] != nil: "The Set does not exist."
        // Ensure the number of editions minted does not exceed the maximum allowed
        self.numberEditionsMintedPerSet[setId]! < SetAndSeries.getSetMaxEditions(setId: setId)!:
            "Set has reached maximum NFT edition capacity."
    }

    // Gets the number of editions that have been minted so far in this set
    let editionNum: UInt32 = self.numberEditionsMintedPerSet[setId]! + (1 as UInt32)

    // Deposit the new NFT into the recipient's collection
    recipient.deposit(token: <-create SetAndSeries.NFT(
        tokenId: tokenId,
        setId: setId,
        editionNum: editionNum
    ))

    // Increment the total supply of NFTs globally
    SetAndSeries.totalSupply = SetAndSeries.totalSupply + (1 as UInt64)

    // Update the count of editions minted in the set
    self.numberEditionsMintedPerSet[setId] = editionNum
}

// More code from Series resource below...