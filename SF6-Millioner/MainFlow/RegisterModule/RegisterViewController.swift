//
//  RegisterViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 06.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var goldImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gold")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private var nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "Enter your nickname"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var nicknameTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.white.cgColor
        textView.layer.cornerRadius = 10
        textView.text = "asda"
        textView.textColor = UIColor.white
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private var registerButton: UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#34B83A")
        button.setTitle("ffff", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.insertSubview(background, at: 0)
        view.addSubview(logoImageView)
        view.addSubview(nicknameLabel)
        view.addSubview(nicknameTextView)
        view.addSubview(registerButton)
        view.addSubview(goldImageView)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 201),
            logoImageView.widthAnchor.constraint(equalToConstant: 201)
        ])
        
        NSLayoutConstraint.activate([
            nicknameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nicknameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nicknameTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nicknameTextView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 30),
            nicknameTextView.heightAnchor.constraint(equalToConstant: 47),
            nicknameTextView.widthAnchor.constraint(equalToConstant: 261)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: nicknameTextView.bottomAnchor, constant: 30),
            registerButton.heightAnchor.constraint(equalToConstant: 47),
            registerButton.widthAnchor.constraint(equalToConstant: 267),
        ])

        NSLayoutConstraint.activate([
            goldImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            goldImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            goldImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
