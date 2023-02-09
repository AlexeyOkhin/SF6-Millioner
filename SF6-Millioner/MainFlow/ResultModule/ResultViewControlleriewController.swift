//
//  ResultViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 09.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    private let mainStackView = UIStackView()
    private var paddingView = [UIView]()
    private var rectangleImages = Array(repeating: UIImageView(), count: 15)
    private var questionLabels = Array(repeating: UILabel(), count: 15)
    private var moneyLabels = Array(repeating: UILabel(), count: 15)
    private var stackViewForCell = [UIStackView]()
    private let rangeForRow = 0 ... 14
    private let amountOfMoney = [0: 100, 1: 200, 2: 300, 3: 500, 4: 1_000, 5: 2_000, 6: 4_000, 7: 8_000, 8: 16_000, 9: 32_000, 10: 64_000, 11: 125_000, 12: 250_000, 13: 500_000, 14: 1_000_000]
    
    private var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        applyLayout()
    }
}

private extension ResultViewController {
    func applyStyle() {
        for i in rangeForRow {
            let newView = UIView()
            newView.translatesAutoresizingMaskIntoConstraints = false
            self.paddingView.append(newView)
            
            let newStackViewForCell = UIStackView()
            newStackViewForCell.translatesAutoresizingMaskIntoConstraints = false
            self.stackViewForCell.append(newStackViewForCell)
            
            let rectangleImage: UIImageView = {
                let imageView = UIImageView()
                if i == 5 || i == 10 || i == 14 {
                    imageView.image = UIImage(named: "Rectangle blue")
                } else if i == 0 {
                    imageView.image = UIImage(named: "Rectangle yellow")
                } else {
                    imageView.image = UIImage(named: "Rectangle violet")
                }
                
                imageView.translatesAutoresizingMaskIntoConstraints = false
                return imageView
            } ()
            
            rectangleImages[i] = rectangleImage
            
            let questionLabel: UILabel = {
                let label = UILabel()
                label.text = "Вопрос \(i + 1)"
                label.textColor = .white
                label.font = .systemFont(ofSize: 20)
                label.numberOfLines = 2
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            questionLabels[i] = questionLabel
            
            let moneyLabel: UILabel = {
                let label = UILabel()
                label.text = "\(amountOfMoney[i] ?? 0) RUB"
                label.textColor = .white
                label.font = .systemFont(ofSize: 20)
                label.textAlignment = .right
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            
            moneyLabels[i] = moneyLabel
            moneyLabels[14].text = "1 Миллион"
        }
        questionLabels.reverse()
        moneyLabels.reverse()
    }
    
    func applyLayout() {
        [background, logoImageView, mainStackView].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        arrangeStackView(
            mainStackView,
            subviews: paddingView
        )
        
        for i in rangeForRow {
            paddingView[i].addSubview(rectangleImages[i])
            paddingView[i].addSubview(stackViewForCell[i])
            
            arrangeStackView(
                stackViewForCell[i],
                subviews: [
                    questionLabels[i],
                    moneyLabels[i]
                ],
                axis: .horizontal,
                distribution: .fill
            )
            
            NSLayoutConstraint.activate([
            rectangleImages[i].topAnchor.constraint(equalTo: paddingView[i].topAnchor),
            rectangleImages[i].bottomAnchor.constraint(equalTo: paddingView[i].bottomAnchor),
            rectangleImages[i].leadingAnchor.constraint(equalTo: paddingView[i].leadingAnchor),
            rectangleImages[i].trailingAnchor.constraint(equalTo: paddingView[i].trailingAnchor),

            stackViewForCell[i].trailingAnchor.constraint(equalTo: paddingView[i].trailingAnchor, constant: -20),
            stackViewForCell[i].leadingAnchor.constraint(equalTo: paddingView[i].leadingAnchor, constant: 20),
            stackViewForCell[i].topAnchor.constraint(equalTo: paddingView[i].topAnchor),
            stackViewForCell[i].bottomAnchor.constraint(equalTo: paddingView[i].bottomAnchor)
            ])
        }

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 42),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -42),
            mainStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 13),
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
}
