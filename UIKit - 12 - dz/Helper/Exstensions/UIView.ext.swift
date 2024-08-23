//
//  UIView.ext.swift
//  UIKit - 12 - dz
//
//  Created by Олег Дмитриев on 23.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
