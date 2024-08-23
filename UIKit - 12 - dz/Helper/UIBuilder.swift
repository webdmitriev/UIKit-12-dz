//
//  UIBuilder.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

class UIBuilder {
    
    func addImage(image: String, brs: CGFloat = 0) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.image = UIImage(named: image)
        
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = brs
        img.layer.masksToBounds = true
        
        return img
    }
    
    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, textAlignment: NSTextAlignment = .left, line: Int = 0, color: UIColor = .appBlack) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        txt.text = text
        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.textAlignment = textAlignment
        txt.numberOfLines = line
        
        txt.textColor = color
        
        return txt
    }
    
}
