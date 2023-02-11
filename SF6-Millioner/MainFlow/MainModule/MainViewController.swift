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
    
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Кто хочет стать миллионером?"
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
        button.setTitle("Правила", for: .normal)
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
        button.setTitle("Старт", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var statisticButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("Статистика", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(statisticButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigationBar()
        setupView()
        setConstraints()
    }

    //MARK: - Private Methods
    
    private func settingNavigationBar() {
        navigationItem.backButtonTitle = "Назад"
        navigationController?.navigationBar.tintColor = .white
    }

    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(mainLabel)
        view.addSubview(rulesButton)
        view.addSubview(startButton)
        view.addSubview(statisticButton)
    }
    
    @objc private func rulesButtonTapped() {
        let rulesVC = RuleViewController()
        navigationController?.pushViewController(rulesVC, animated: true)
        print("Rules")
    }
    
    @objc private func startButtonTapped() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
        print("Start")
        
//        let registerVC = RegisterViewController()
//        //navigationController?.pushViewController(registerVC, animated: false)
//        registerVC.modalPresentationStyle = .fullScreen
//        navigationController?.showDetailViewController(registerVC, sender: self)
    }
    
    @objc private func statisticButtonTapped() {
        let hiScoreViewController = HiScoreViewController()
        navigationController?.pushViewController(hiScoreViewController, animated: true)
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
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            
            mainLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            rulesButton.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 70),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.widthAnchor.constraint(equalToConstant: 250),
            
            startButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor, constant: 20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 250),
            
            statisticButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            statisticButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statisticButton.heightAnchor.constraint(equalToConstant: 50),
            statisticButton.widthAnchor.constraint(equalToConstant: 250),
            statisticButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

