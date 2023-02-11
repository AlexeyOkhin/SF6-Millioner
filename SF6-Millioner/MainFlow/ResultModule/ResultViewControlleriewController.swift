//
//  ResultViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 09.02.2023.
//

import UIKit
import AVFAudio

final class ResultViewController: UIViewController {
    private let mainStackView = UIStackView()
    private var paddingView = [UIView]()
    private var rectangleImages = Array(repeating: UIImageView(), count: 15)
    private var questionLabels = Array(repeating: UILabel(), count: 15)
    private var moneyLabels = Array(repeating: UILabel(), count: 15)
    private var stackViewForCell = [UIStackView]()
    private let rangeForRow = 0 ... 14
    private var currentLevel = Int()
    private var amountOfMoney = [String]()
    private var isTrueAnswer = Bool()
    private var fireproofAmount = ""
    private var timer = Timer()
    private var timerSound: AVAudioPlayer!
    
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
    
    init(level: Int, costQuestion: [String], isTrueAnswer: Bool) {
        self.currentLevel = level
        self.amountOfMoney = costQuestion
        self.isTrueAnswer = isTrueAnswer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
        self.hideNavigationBar()
        applyStyle()
        applyLayout()
        checkAnswer(isTrueAnswer)
    }
    
    @objc func handleTap() {
        if isTrueAnswer {
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
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
                if i == 5 || i == 10 {
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
                label.text = "\(amountOfMoney[i]) RUB"
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
    
    func checkAnswer(_ answer: Bool) {
        playSound(answer)
        if answer {
            rectangleImages.reverse()
            animateForWin()
        } else {
            if currentLevel > 5 && currentLevel < 11 {
                rectangleImages[10].image = UIImage(named: "Rectangle green")
                animateForLose(rectangleImages[10])
                fireproofAmount = amountOfMoney[4]
            } else if currentLevel > 10 && currentLevel < 15 {
                rectangleImages[5].image = UIImage(named: "Rectangle green")
                animateForLose(rectangleImages[5])
                fireproofAmount = amountOfMoney[9]
            } else if currentLevel == 15 {
                rectangleImages[0].image = UIImage(named: "Rectangle green")
            } else if currentLevel < 5 {
                fireproofAmount = "0 RUB"
                showAlert()
            }
        }
    }
    
    func animateForWin() {
        rectangleImages[currentLevel - 1].image = UIImage(named: "Rectangle green")
        if currentLevel == 1 {
            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .curveLinear,
                animations: { [self] in
                UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                    rectangleImages[currentLevel - 1].alpha = 0.0
                }
            }){ [self]_ in
                rectangleImages[currentLevel - 1].alpha = 1.0
            }
        } else {
            UIView.animate(
                withDuration: 0.3,
                delay: 0.0,
                options: .curveLinear,
                animations: { [self] in
                UIView.modifyAnimations(withRepeatCount: 2, autoreverses: true) {
                    rectangleImages[currentLevel - 2].alpha = 0.0
                }
            }) { [self]_ in
                rectangleImages[currentLevel - 2].alpha = 1.0
                rectangleImages[currentLevel - 2].image = UIImage(named: "Rectangle violet")
                rectangleImages[currentLevel - 1].image = UIImage(named: "Rectangle green")
            }
        }
    }
    
    func animateForLose(_ rectangleImages: UIImageView) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            options: .curveLinear,
            animations: {
            UIView.modifyAnimations(
                withRepeatCount: 2,
                autoreverses: true
            ){
                rectangleImages.alpha = 0.0
            }
        }) { [self] _ in
            rectangleImages.alpha = 1.0
            showAlert()
        }
    }
    
    func showAlert() {
        showAlert(
            title: "You Loser",
            message: "(You won \(fireproofAmount) RUB)"
        ){ [self] _ in
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func playSound(_ isTrueAnswer: Bool) {
        if isTrueAnswer {
            let url = Bundle.main.url(forResource: "answerTrue", withExtension: "mp3")
            timerSound = try! AVAudioPlayer(contentsOf: url!)
            timerSound.play()
        } else {
            let url = Bundle.main.url(forResource: "answerFalse", withExtension: "mp3")
            timerSound = try! AVAudioPlayer(contentsOf: url!)
            timerSound.play()
        }
    }
}
