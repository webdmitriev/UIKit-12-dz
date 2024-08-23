//
//  NewsCell.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

class NewsCell: UICollectionViewCell, CellProtocol {

    static var reuseID: String = "NewsCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var newsBackground: UIImageView = appBuilder.addImage(image: "news-01")
    private lazy var newsLabel: UILabel = appBuilder.addLabel(text: "", fontS: 24, fontW: .black, line: 2, color: .appWhite)
    private lazy var newsDescr: UILabel = appBuilder.addLabel(text: "", fontS: 14, fontW: .medium, line: 3, color: .appWhite)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        contentView.addSubviews(newsBackground, newsLabel, newsDescr)
        
        setupConstr()
    }
    
    func setupCell(item: CollectionItem) {
        self.newsBackground.image = UIImage(named: item.image)
        self.newsLabel.text = item.header
        self.newsDescr.text = item.text
    }
    
    func setupConstr() {
        NSLayoutConstraint.activate([
            newsBackground.topAnchor.constraint(equalTo: topAnchor),
            newsBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            newsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            newsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            newsDescr.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 14),
            newsDescr.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            newsDescr.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
