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
        //imageView.backgroundColor = .red
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
    
    private var nicknameTextView: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "Djinsolobzik"
        //textField.becomeFirstResponder()

        textField.textColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private var registerButton: UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.tintColor = .white
        button.setTitle("Register and start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        //view.insertSubview(background, at: 0)
        view.addSubview(goldImageView)
        view.addSubview(logoImageView)
//        view.addSubview(nicknameLabel)
//        view.addSubview(nicknameTextView)
//        view.addSubview(registerButton)

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            goldImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            goldImageView.heightAnchor.constraint(equalToConstant: 220),
            goldImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goldImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            logoImageView.heightAnchor.constraint(equalToConstant: 170),
            logoImageView.widthAnchor.constraint(equalToConstant: 170)
        ])

        let stackView = UIStackView(arrangedSubviews: [nicknameLabel, nicknameTextView, registerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            stackView.heightAnchor.constraint(equalToConstant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        
//        NSLayoutConstraint.activate([
//            nicknameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            nicknameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20)
//        ])
//
//        NSLayoutConstraint.activate([
//            nicknameTextView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            nicknameTextView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 30),
//            nicknameTextView.heightAnchor.constraint(equalToConstant: 47),
//            nicknameTextView.widthAnchor.constraint(equalToConstant: 261)
//        ])
//
//        NSLayoutConstraint.activate([
//            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            registerButton.topAnchor.constraint(equalTo: nicknameTextView.bottomAnchor, constant: 30),
//            registerButton.heightAnchor.constraint(equalToConstant: 47),
//            registerButton.widthAnchor.constraint(equalToConstant: 267),
//        ])

//        NSLayoutConstraint.activate([
//            goldImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            goldImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            goldImageView.heightAnchor.constraint(equalToConstant: 100)
//        ])
    }
}
