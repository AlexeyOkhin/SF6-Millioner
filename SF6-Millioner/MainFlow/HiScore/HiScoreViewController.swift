//
//  HiScoreViewController.swift
//  SF6-Millioner
//
//  Created by KODDER on 10.02.2023.
//

import UIKit

class HiScoreViewController: UIViewController {

    //MARK: - Private Properties
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HiScoreTableViewCell.self,
                           forCellReuseIdentifier: HiScoreTableViewCell.identifier)
        tableView.backgroundColor = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setConstraints()
        settingNavigationBar()
    }
    
    private func settingNavigationBar() {
        navigationItem.title = "Статистика"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundImageView.frame = view.bounds
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HiScoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do {
            let highScore = try HiScoreStorage()
            return highScore.getAmountOfStorage()
        } catch {
            print(error)
        }
        
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HiScoreTableViewCell.identifier,
                                                 for: indexPath) as? HiScoreTableViewCell
        do {
            let highScore = try HiScoreStorage()
            let highScoreValue = highScore.getHiScore()?.components(separatedBy: "--")
            cell?.nameLabel.text = highScoreValue?[0]
            cell?.scoreLabel.text = highScoreValue?[1]
        } catch {
            print(error)
        }
                
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
    
}

//MARK: - Constraints
extension HiScoreViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
