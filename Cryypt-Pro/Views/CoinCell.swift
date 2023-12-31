//
//  CoinCell.swift
//  Cryypt-Pro
//
//  Created by Burhan Göksel on 15.07.2023.
//

import UIKit
import SDWebImage

class CoinCell: UITableViewCell {
    
    static let identifier = "CoinCell"
    
    private(set) var coin: Coin!
    
    private let coinLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "questionmark")
        return imageView
    }()
    
    private let coinName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Title"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with coin: Coin) {
        self.coin = coin
        self.coinName.text = coin.name
        
        self.coinLogo.sd_setImage(with: coin.logoURL)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.coinName.text = nil
        self.coinLogo.image = nil
    }
    
    private func setupUI(){
        self.addSubview(coinLogo)
        self.addSubview(coinName)
        
        coinLogo.translatesAutoresizingMaskIntoConstraints = false
        coinName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coinLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            coinLogo.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            coinLogo.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            coinLogo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            coinName.leadingAnchor.constraint(equalTo: coinLogo.trailingAnchor),
            coinName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            
        ])
        
    }
}
