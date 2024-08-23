//
//  StoryCell.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

protocol CellProtocol: AnyObject {
    static var reuseID: String { get }
    func setupCell(item: CollectionItem)
    func setupConstr()
}

class StoryCell: UICollectionViewCell, CellProtocol {

    static var reuseID: String = "StoryCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var storyImage: UIImageView = appBuilder.addImage(image: "avatar-01")
    private lazy var storyLabel: UILabel = appBuilder.addLabel(text: "", fontS: 16, fontW: .medium, textAlignment: .center, line: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.storyImage.layer.cornerRadius = self.contentView.bounds.width / 2.0
        
        contentView.addSubviews(storyImage, storyLabel)
        
        setupConstr()
    }
    
    func setupCell(item: CollectionItem) {
        self.storyImage.image = UIImage(named: item.image)
        self.storyLabel.text = item.name
    }
    
    internal func setupConstr() {
        NSLayoutConstraint.activate([
            storyImage.topAnchor.constraint(equalTo: topAnchor),
            storyImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            storyImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            storyImage.heightAnchor.constraint(equalTo: storyImage.widthAnchor),
            
            storyLabel.topAnchor.constraint(equalTo: storyImage.bottomAnchor, constant: 5),
            storyLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            storyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
