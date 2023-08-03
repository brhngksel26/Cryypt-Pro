//
//  HomeControllerViewModel.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 16.07.2023.
//

import Foundation
import UIKit

class HomeControllerViewModel {
    
    var onCoinsUpdated: (()->Void)?
    var onErrorMessage: ((CoinServiceError)->Void)?
    
    private(set) var allCoins: [Coin] = [] {
        didSet {
            self.onCoinsUpdated?()
        }
    }
    
    private(set) var filteredCoins: [Coin] = []
    
    init() {
        self.fetchCoins()
    }
        
    public func fetchCoins() {
        
        let endpoint = Endpoint.fetchCoins()
        
        CoinService.fetchCoins(with: endpoint) { [weak self] result in
            switch result {
            case .success(let coins):
                self?.allCoins = coins
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
            
        
    }
}

extension HomeControllerViewModel {
    
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActivate = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        
        return isActivate && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?){
        self.filteredCoins = allCoins
        
        if let searchText = searchBarText?.lowercased(){
            guard !searchText.isEmpty else { self.onCoinsUpdated?(); return }
            
            self.filteredCoins = self.filteredCoins.filter({
                $0.name.lowercased().contains(searchText)
            })
        }
        
        self.onCoinsUpdated?()
        
    }
}
