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
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Statistic"
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let hiScoreStorage = try? HiScoreStorage()
    private var dictionaryHiScore = [String: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(headerLabel)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setConstraints()
        
        guard let hiScoreStorage else { return }
        dictionaryHiScore = hiScoreStorage.getHiScore()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundImageView.frame = view.bounds
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HiScoreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dictionaryHiScore.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HiScoreTableViewCell.identifier,
                                                       for: indexPath) as? HiScoreTableViewCell else {
            return UITableViewCell()
        }
        
        let dict = Array(dictionaryHiScore)
        let sortedKeysAndValues = dict.sorted { $0.0 < $1.0 }
        
        let key = sortedKeysAndValues[indexPath.row].key
        let value = sortedKeysAndValues[indexPath.row].value
        cell.setup(key, value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}

//MARK: - Constraints
extension HiScoreViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
