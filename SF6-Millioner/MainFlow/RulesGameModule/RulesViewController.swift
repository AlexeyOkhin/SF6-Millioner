//
//  RulesViewController.swift
//  SF6-Millioner
//
//  Created by Alexander Baranov on 07.02.2023.
//

import UIKit

class RuleViewController: UIViewController{
    
    //MARK: - UIElements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Для победы вам необходимо правильно ответить на 15 вопросов.\n\nКаждый вопрос имеет четыре варианта ответа, лишь одни является верным.\n\nТри несгораемых суммы:\n- 1000 RUB \n- 32000 RUB \n- 1000000 RUB\n\nТри подсказки: \n- 50/50: удалятся два неверных ответа. \n- Помощь зала: предложит возможный вариант по мнению зала.\n- Звонок другу: предложит наиболее вероятный ответ."
        label.numberOfLines = 50
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundImageView)
        view.addSubview(rulesLabel)
        
        settingNavigationBar()
        setConstraints()
    }
    
    //MARK: - Setups
    
    private func settingNavigationBar() {
        navigationItem.backButtonTitle = "Назад"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Правила"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

//MARK: - Constraints
extension RuleViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            rulesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rulesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
