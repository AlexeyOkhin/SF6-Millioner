//
//  UILabel + Extension.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

extension UILabel {
    convenience init(name: String, font: UIFont? = .systemFont(ofSize: 16, weight: .bold)) {
        self.init()
        self.text = name
        self.font = font
    }
}
