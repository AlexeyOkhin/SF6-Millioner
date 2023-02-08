//
//  GameViewController.swift
//  SF6-Millioner
//
//  Created by Nikita Zubov on 08.02.2023.
//

import UIKit

class GameViewController: UIViewController {

    //MARK: - Private Properties
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var questionLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "За сколько секунд атакующая баскетбольная команда должна перевести мяч со своей половины поля на половину противника?"
        labelView.font = .systemFont(ofSize: 18)
        labelView.textColor = .white
        labelView.numberOfLines = 0
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()

    private var questionNumberLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "Question 5"
        labelView.font = .systemFont(ofSize: 24)
        labelView.textColor = .white
        labelView.numberOfLines = 1
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    private var scoreLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "1000 RUB"
        labelView.font = .systemFont(ofSize: 24)
        labelView.textColor = .white
        labelView.numberOfLines = 1
        labelView.textAlignment = .center
        labelView.translatesAutoresizingMaskIntoConstraints = false
        return labelView
    }()
    
    //MARK: - Answer Button
    private var answerAButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("A", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var answerBButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("B", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var answerCButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("C", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    private var answerDButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("D", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    //MARK: - Help Button
    private var fiftyFifty: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "fiftyFifty"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var hallHelp: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "hallHelp"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var callFriend: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "callFriend"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        initSubviews()
        setupConstraints()
    }
    
    private func initSubviews() {
        self.view.insertSubview(background, at: 0)
        self.view.addSubview(logoImageView)
        self.view.addSubview(questionLabel)
        self.view.addSubview(questionNumberLabel)
        self.view.addSubview(scoreLabel)
        
        self.view.addSubview(answerAButton)
        self.view.addSubview(answerBButton)
        self.view.addSubview(answerCButton)
        self.view.addSubview(answerDButton)
        
        self.view.addSubview(fiftyFifty)
        self.view.addSubview(hallHelp)
        self.view.addSubview(callFriend)
    }
    
    //MARK: - Setup Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19),
            logoImageView.heightAnchor.constraint(equalToConstant: 87),
            logoImageView.widthAnchor.constraint(equalToConstant: 87)
        ])
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 21),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -7)
        ])
        
        NSLayoutConstraint.activate([
            questionNumberLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 14),
            questionNumberLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 14),
            scoreLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            answerAButton.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 40),
            answerAButton.heightAnchor.constraint(equalToConstant: 54),
            answerAButton.widthAnchor.constraint(equalToConstant: 321),
            answerAButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            answerBButton.topAnchor.constraint(equalTo: answerAButton.bottomAnchor, constant: 30),
            answerBButton.heightAnchor.constraint(equalToConstant: 54),
            answerBButton.widthAnchor.constraint(equalToConstant: 321),
            answerBButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            answerCButton.topAnchor.constraint(equalTo: answerBButton.bottomAnchor, constant: 30),
            answerCButton.heightAnchor.constraint(equalToConstant: 54),
            answerCButton.widthAnchor.constraint(equalToConstant: 321),
            answerCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            answerDButton.topAnchor.constraint(equalTo: answerCButton.bottomAnchor, constant: 30),
            answerDButton.heightAnchor.constraint(equalToConstant: 54),
            answerDButton.widthAnchor.constraint(equalToConstant: 321),
            answerDButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fiftyFifty.topAnchor.constraint(equalTo: answerDButton.bottomAnchor, constant: 60),
            fiftyFifty.heightAnchor.constraint(equalToConstant: 81),
            fiftyFifty.widthAnchor.constraint(equalToConstant: 105),
            fiftyFifty.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            hallHelp.topAnchor.constraint(equalTo: answerDButton.bottomAnchor, constant: 60),
            hallHelp.heightAnchor.constraint(equalToConstant: 81),
            hallHelp.widthAnchor.constraint(equalToConstant: 105),
            hallHelp.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            callFriend.topAnchor.constraint(equalTo: answerDButton.bottomAnchor, constant: 60),
            callFriend.heightAnchor.constraint(equalToConstant: 81),
            callFriend.widthAnchor.constraint(equalToConstant: 105),
            callFriend.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25)
        ])
    }
}
