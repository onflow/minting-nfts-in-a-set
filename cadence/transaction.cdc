import SetAndSeries from 0x01
import NonFungibleToken from 0x02

transaction {

    let adminCheck: auth(AdminEntitlement) &SetAndSeries.Admin
    let seriesRef: &SetAndSeries.Series
    let receiver: &{NonFungibleToken.CollectionPublic}

    prepare(acct: auth(Storage, Capabilities) &Account) {
        // Borrow the admin reference from storage
        self.adminCheck = acct.capabilities.storage.borrow<&SetAndSeries.Admin>(
            from: SetAndSeries.AdminStoragePath
        ) ?? panic("Could not borrow admin reference")

        // Borrow the series reference
        self.seriesRef = self.adminCheck.borrowSeries(seriesId: 1)

        // Borrow the receiver's capability reference
        self.receiver = acct.capabilities.borrow<&SetAndSeries.Collection{NonFungibleToken.CollectionPublic}>(
            SetAndSeries.CollectionPublicPath
        ) ?? panic("Could not borrow capability")
    }

    execute {
        // Mint an NFT and deposit it to the recipient's collection
        self.seriesRef.mintSetAndSeriesNFT(
            recipient: self.receiver,
            tokenId: 1,
            setId: 1
        )
        log("Minted NFT in account 1")
    }
}
