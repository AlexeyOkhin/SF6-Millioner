//
//  HiScoreTableViewCell.swift
//  SF6-Millioner
//
//  Created by KODDER on 10.02.2023.
//

import UIKit

class HiScoreTableViewCell: UITableViewCell {

    static let identifier = "HiScoreTableViewCell"
    
    //MARK: - Private Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(nameLabel)
        addSubview(scoreLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Constraints

extension HiScoreTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            scoreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            scoreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
