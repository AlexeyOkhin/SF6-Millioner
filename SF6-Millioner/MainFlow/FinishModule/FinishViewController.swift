//
//  FinishViewController.swift
//  SF6-Millioner
//
//  Created by Ilsaf Nabiullin on 05.02.2023.
//

import UIKit


final class FinishViewController: UIViewController {
    
    private var failAttempt: Int?
    private var isWin: Bool?
    private var money: String?
    
    init(failAttempt: Int, isWin: Bool, money: String) {
        self.failAttempt = failAttempt
        self.isWin = isWin
        self.money = money
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var failAttemptLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 24)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 500, width: 300, height: 100))
        button.backgroundColor = UIColor(hexString: "#34B83A")
        button.setTitle("Играть еще раз", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(playAgainPressed), for: .touchUpInside)
        
        return button
    }()
    
    private var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSubviews()
        setupResultLabel()
        setupFailAttemptLabel()
        setupConstraints()
    }
    
    private func initSubviews() {
        self.view.insertSubview(background, at: 0)
        self.view.addSubview(logoImageView)
        self.view.addSubview(failAttemptLabel)
        self.view.addSubview(resultLabel)
        self.view.addSubview(playAgainButton)
    }
    
    private func setupFailAttemptLabel() {
        if isWin! {
            failAttemptLabel.text = "Ты выиграл \(money ?? "0")) RUB"
        } else {
            var used = "Использовано"
            var attemptWord = "попыток"
            
            if failAttempt == 1 {
                used = "Использована"
                attemptWord = "попытка"
            } else if failAttempt == 2 || failAttempt == 3 || failAttempt == 4 {
                attemptWord = "попытки"
            }
            
            failAttemptLabel.text = """
            Ты проиграл!
            \(used) \(failAttempt!) \(attemptWord).
            Ты выиграл \(money!) RUB
            """
        }
    }
    
    private func setupResultLabel() {
        if isWin! {
            resultLabel.text = "ПОБЕДА"
            resultLabel.textColor = UIColor.green
        } else {
            resultLabel.text = "ПРОИГРЫШ"
            resultLabel.textColor = UIColor(hexString: "#F66324")
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19),
            logoImageView.heightAnchor.constraint(equalToConstant: 201),
            logoImageView.widthAnchor.constraint(equalToConstant: 201)
        ])
        
        NSLayoutConstraint.activate([
            failAttemptLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            failAttemptLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 5),
            failAttemptLabel.heightAnchor.constraint(equalToConstant: 124),
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: failAttemptLabel.bottomAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 87),
        ])
        
        NSLayoutConstraint.activate([
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -84),
            playAgainButton.widthAnchor.constraint(equalToConstant: 300),
            playAgainButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    @objc private func playAgainPressed() {

        navigationController?.popToRootViewController(animated: true)

    }
}
