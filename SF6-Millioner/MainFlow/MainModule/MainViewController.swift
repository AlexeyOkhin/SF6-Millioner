//
//  MainViewController.swift
//  SF6-Millioner
//
//  Created by Djinsolobzik on 05.02.2023.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Private Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Who wants to be a millionaire"
        label.font = .systemFont(ofSize: 34)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("Rules of the game", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("Start the game", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }

    //MARK: - Private Methods
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(mainLabel)
        view.addSubview(rulesButton)
        view.addSubview(startButton)
    }
    
    @objc private func rulesButtonTapped() {
        print("Rules")
    }
    
    @objc private func startButtonTapped() {
        print("Start")
    }

}

//MARK: - Constraints
extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 225),
            logoImageView.widthAnchor.constraint(equalToConstant: 225),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rulesButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 100),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.widthAnchor.constraint(equalToConstant: 250),
            
            startButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 250),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

