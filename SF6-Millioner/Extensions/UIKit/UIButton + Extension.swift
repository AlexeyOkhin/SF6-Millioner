//
//  UIButton + Extension.swift
//  VKAllCups
//
//  Created by Djinsolobzik on 03.12.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                    backgroundCollor: UIColor,
                    titleColor: UIColor,
                    cornerRadius: CGFloat,
                    font: UIFont? = .systemFont(ofSize: 18)) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundCollor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
    }
    
}
