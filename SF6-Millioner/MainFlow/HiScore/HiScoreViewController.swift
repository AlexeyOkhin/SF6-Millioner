//
//  HiScoreViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 09.02.2023.
//

import UIKit

final class HiScoreViewController: UIViewController {
    private let mainStackView = UIStackView()
    private var paddingView = [UIView]()
    private let rectangleImage = UIImageView()
    private let questionLabel = UILabel()
    private let moneyLabel = UILabel()
    private let stackViewForCell = UIStackView()
    private let rangeForRow = 0 ... 14
    
    private var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPaddingView()
        applyStyle()
        applyLayout()
    }
}

private extension HiScoreViewController {
    func applyStyle() {
        
        
        
        rectangleImage.image = UIImage(named: "Rectangle violet")
        
        applyStyleLabel(
            questionLabel,
            text: "Вопрос 1"
        )
        
        applyStyleLabel(
            moneyLabel,
            text: "100 RUB",
            textAlignment: .right
        )
    }
    
    func applyLayout() {
        
        rectangleImage.translatesAutoresizingMaskIntoConstraints = false
        stackViewForCell.translatesAutoresizingMaskIntoConstraints = false
        
        [background, mainStackView].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        arrangeStackView(
            mainStackView,
            subviews: [logoImageView]
        )
        
        arrangeStackView(
            mainStackView,
            subviews: paddingView
        )
        
        arrangeStackView(
            stackViewForCell,
            subviews: [
                questionLabel,
                moneyLabel
            ],
            axis: .horizontal,
            distribution: .fill
        )

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 42),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -42),
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    // MARK: Supporting methods
    func arrangeStackView(
        _ stackView: UIStackView,
        subviews: [UIView],
        spacing: CGFloat = 8,
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fillEqually,
        alignment: UIStackView.Alignment = .fill
    ) {
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        subviews.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
    }
    
    func createPaddingView() {
        for _ in rangeForRow {
            let newView = UIView()
            
            newView.backgroundColor = .red
            newView.addSubview(rectangleImage)
            newView.addSubview(stackViewForCell)
            
            NSLayoutConstraint.activate([
                rectangleImage.topAnchor.constraint(equalTo: newView.topAnchor),
                rectangleImage.bottomAnchor.constraint(equalTo: newView.bottomAnchor),
                rectangleImage.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
                rectangleImage.trailingAnchor.constraint(equalTo: newView.trailingAnchor),

                stackViewForCell.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
                stackViewForCell.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
                stackViewForCell.topAnchor.constraint(equalTo: newView.topAnchor),
                stackViewForCell.bottomAnchor.constraint(equalTo: newView.bottomAnchor)
            ])
            
            self.paddingView.append(newView)
        }
    }
    
    func applyStyleLabel(
        _ label: UILabel,
        text: String = "",
        textColor: UIColor = .white,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 1,
        sizeFont: UIFont = .systemFont(ofSize: 20)
    ) {
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.font = sizeFont
    }
}
