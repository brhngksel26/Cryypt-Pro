//
//  HomeControllerViewModel.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 16.07.2023.
//

import Foundation

class HomeControllerViewModel {
    
    var onCoinsUpdated: (()->Void)?
    var onErrorMessage: ((CoinServiceError)->Void)?
    
    private(set) var coins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    init() {
        self.fetchCoins()
    }
        
    public func fetchCoins() {
        
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.coins = coins
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
            
        
    }
}
