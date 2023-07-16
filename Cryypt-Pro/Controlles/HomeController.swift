//
//  ViewController.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 15.07.2023.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    
    private let coins: [Coin] = Coin.getMockArray()
    
    // MARK: - UI Componets
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        return tableView
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = .systemRed
    }

    // MARK: - UI Setup
    
    private func setupUI() {
        self.navigationItem.title = "Crypto Pro"
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    // MARK: - Selectors

}


// MARK: - TableView Functions

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell else {
            fatalError("Unable to dequeue CoinCell in HomeController")
        }
        
        let coin = self.coins[indexPath.row]
        cell.configure(with: coin)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.coins.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let coin = self.coins[indexPath.row]
        let cyrptoViewModel = ViewCryptoControllerViewModel(coin)
        let cryptoView = ViewCryptoController(cyrptoViewModel)
        self.navigationController?.pushViewController(cryptoView, animated: true)
    }
    
}
