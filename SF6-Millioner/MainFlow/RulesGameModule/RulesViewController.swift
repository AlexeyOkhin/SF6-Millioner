//
//  RulesViewController.swift
//  SF6-Millioner
//
//  Created by Alexander Baranov on 07.02.2023.
//

import UIKit

extension NSMutableAttributedString {
    public func getRangeOfString(textToFind:String)->NSRange{
        let foundRange = self.mutableString.range(of: textToFind)
        
        return foundRange
    }
}

class RuleViewController: UIViewController{
    var timerForShowScrollIndicator: Timer?
    
    //MARK: - UIElements
    
    private let backgroundView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var rulesHeading: UILabel = {
        let heading = UILabel()
        heading.text = "Правила"
        heading.textColor = .white
        heading.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    }()
    
    private lazy var rulesContent: UITextView = {
        let content = UITextView()
        let myAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 21, weight: .regular),
                            NSAttributedString.Key.foregroundColor: UIColor.white,
                            ]
        let myString = NSMutableAttributedString(string: "Для победы вам необходимо правильно ответить на 15 вопросов.\n\nКаждый вопрос имеет четыре варианта ответа, лишь одни является верным.\n\nТри несгораемых суммы:\n- 1000 RUB \n- 32000 RUB \n- 1000000 RUB\n\nТри подсказки: \n- 50/50: удалятся два неверных ответа. \n- Помощь зала: предложит возможный вариант по мнению зала.\n-Звонок другу: предложит наиболее вероятный ответ.", attributes: myAttribute )
        var anotherAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),
                                 NSAttributedString.Key.foregroundColor: UIColor.green,
                                 ]
        var keyPhrases = ["1000", "32000", "1000000", "50/50:", "Помощь зала:", "Звонок другу:"]
        for element in keyPhrases{
            var myRange = myString.getRangeOfString(textToFind: element)
            myString.addAttributes(anotherAttribute, range: myRange)
        }
        anotherAttribute = [ NSAttributedString.Key.font: UIFont.systemFont(ofSize: 23, weight: .bold),
                                 ]
        keyPhrases = ["Три несгораемых суммы:", "Три подсказки:"]
        for element in keyPhrases{
            var myRange = myString.getRangeOfString(textToFind: element)
            myString.addAttributes(anotherAttribute, range: myRange)
        }
        content.attributedText = myString
        content.backgroundColor = .clear
        content.isEditable = false
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var backToMainScreenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 25
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(backToMainScreenButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        setupHierarchy()
        setupRulesHeading()
        setupRulesContent()
        setupBackToMainScreenButton()
        startTimerForShowScrollIndicator()
        setupBackgroundView()
    }
    
    //MARK: - Setups
        
    private func startTimerForShowScrollIndicator() {
        self.timerForShowScrollIndicator = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.showScrollIndicatorsInContacts), userInfo: nil, repeats: true)
    }
    
    private func setupHierarchy() {
        view.addSubview(backgroundView)
        view.addSubview(rulesHeading)
        view.addSubview(rulesContent)
        view.addSubview(backToMainScreenButton)
    }
    
    private func setupRulesHeading(){
        self.rulesHeading.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.rulesHeading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.rulesHeading.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupRulesContent(){
        self.rulesContent.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.rulesContent.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.rulesContent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        self.rulesContent.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    private func setupBackToMainScreenButton() {
        self.backToMainScreenButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        self.backToMainScreenButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.backToMainScreenButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50).isActive = true
        self.backToMainScreenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupBackgroundView() {
        self.backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    //MARK: - Actions
    
    @objc private func backToMainScreenButtonAction() {
        self.navigationController?.popViewController(animated: true)
   }
    
    @objc func showScrollIndicatorsInContacts() {
            UIView.animate(withDuration: 0.001) {
                self.rulesContent.flashScrollIndicators()
            }
        }
}

