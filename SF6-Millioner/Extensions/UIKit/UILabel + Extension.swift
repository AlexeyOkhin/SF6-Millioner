//
//  UILabel + Extension.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 06.02.2023.
//

import UIKit

extension UILabel {
    convenience init(name: String, font: UIFont? = .systemFont(ofSize: 20)) {
        self.init()
        self.text = name
        self.font = font
    }
}
