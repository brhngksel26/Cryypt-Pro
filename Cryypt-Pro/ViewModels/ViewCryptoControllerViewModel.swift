//
//  ViewCryptoControllerViewModel.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 16.07.2023.
//

import UIKit


class ViewCryptoControllerViewModel {
        
    // MARK: - Variables
    
    let coin: Coin
    
    // MARK: Initializer
    
    init(_ coin: Coin) {
        self.coin = coin
    }
    
    
    
    // MARK: - Computed Properties
    var rankLabel: String {
        return "Rank \(self.coin.rank)"
    }
    
    var priceLabel: String {
        return "Price: $\(self.coin.pricingData.CAD.price) CAD"
    }
    
    var marketCapLabel: String {
        return "Market Cap: \(self.coin.pricingData.CAD.market_cap) CAD"
    }
    
    var maxSupplyLabel: String {
        if let maxSupply = self.coin.maxSupply {
            return "Max Supply: \(maxSupply)"
        } else {
            return "123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n123\n"
        }
    }
}
