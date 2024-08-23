//
//  MessageCell.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

class MessageCell: UICollectionViewCell, CellProtocol {

    static var reuseID: String = "MessageCell"
    
    private let appBuilder = UIBuilder()
    
    private lazy var messageImage: UIImageView = appBuilder.addImage(image: "message-01")
    private lazy var messageLabel: UILabel = appBuilder.addLabel(text: "", fontS: 14, fontW: .medium, line: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .appGray
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        messageImage.layer.cornerRadius = 20
        
        contentView.addSubviews(messageImage, messageLabel)
        
        setupConstr()
    }
    
    func setupCell(item: CollectionItem) {
        self.messageImage.image = UIImage(named: item.image)
        self.messageLabel.text = item.text
    }
    
    func setupConstr() {
        NSLayoutConstraint.activate([
            messageImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            messageImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            messageImage.widthAnchor.constraint(equalToConstant: 61),
            
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: messageImage.trailingAnchor, constant: 12),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

