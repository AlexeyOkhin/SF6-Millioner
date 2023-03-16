//
//  RegisterViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 06.02.2023.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
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
        return imageView
    }()
    
    private var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.text = "Введите свое имя"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var background: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.placeholder = "Например: Читер"
        textField.textColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 10,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.tintColor = .white
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private var registerButton: UIButton {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.tintColor = .white
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        button.layer.cornerRadius = CGFloat(15)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(goldImageView)
        view.addSubview(logoImageView)
        
        addTaps()
        
        setupConstraints()
        
        usernameTextField.delegate = self

        let stackView = UIStackView(arrangedSubviews: [usernameLabel, usernameTextField, registerButton])
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameTextField.text = ""
    }

    private func setupConstraints() {
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
    }
    
    @objc private func registerButtonPressed() {
        let mainVC = MainViewController()
        
        mainVC.welcomeLabel.text = "Добро пожаловать \(usernameTextField.text ?? "")!"
        mainVC.username = usernameTextField.text ?? ""
        hideKeyboard()
        self.navigationController?.pushViewController(mainVC, animated: true)
        navigationItem.backButtonTitle = "Назад"
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        
        return true
    }
}
