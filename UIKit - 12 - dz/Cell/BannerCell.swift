//
//  BannerCell.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

class BannerCell: UICollectionViewCell, CellProtocol {

    static var reuseID: String = "BannerCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var bannerImage: UIImageView = appBuilder.addImage(image: "banner-01")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true

        contentView.addSubview(bannerImage)
        
        setupConstr()
    }
    
    func setupCell(item: CollectionItem) {
        self.bannerImage.image = UIImage(named: item.image)
    }
    
    func setupConstr() {
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: topAnchor),
            bannerImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
