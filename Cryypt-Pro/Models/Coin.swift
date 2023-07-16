//
//  Coin.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 15.07.2023.
//

import Foundation

struct CoinArray: Decodable {
    let data: [Coin]
}

struct Coin: Decodable {
    let id: Int
    let name: String
    let maxSupply: Int?
    let rank: Int
    let pricingData: PricingData
    
    var logoURL: URL? {
        return URL(string: "https://s2.coinmarketcap.com/static/img/coins/200x200/\(id).png")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case maxSupply = "max_supply"
        case rank = "cmc_rank"
        case pricingData = "quote"
    }
}

struct PricingData: Decodable {
    let CAD: CAD
}

struct CAD: Decodable {
    let price: Double
    let marketCap: Double
}

extension Coin {
    public static func getMockArray() -> [Coin] {
        return [
            Coin(id: 1, name: "Bitcoin", maxSupply: 200, rank: 1, pricingData: PricingData(CAD: CAD(price: 50000, marketCap: 1_000_000))),
            Coin(id: 2, name: "Ethereum", maxSupply: nil, rank: 2, pricingData: PricingData(CAD: CAD(price: 2000, marketCap: 500_000))),
            Coin(id: 3, name: "Monero", maxSupply: nil, rank: 3, pricingData: PricingData(CAD: CAD(price: 200, marketCap: 250_000)))
        ]
    }
}
