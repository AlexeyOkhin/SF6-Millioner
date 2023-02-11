//
//  GameViewController.swift
//  SF6-Millioner
//
//  Created by Nikita Zubov on 08.02.2023.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {

    //MARK: - Properties
    var game = Game(nameGamer: "Алексей", fireproofAmount: 0)
    var audioCheckAnswer: AVAudioPlayer!
    var timer = Timer()
    var timerSound: AVAudioPlayer!
    var secondsPassed = 0

    //MARK: - Private Properties
    private var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var questionLabel: UILabel = {
        let labelView = UILabel()
        labelView.text = "За сколько секунд атакующая баскетбольная команда должна перевести мяч со своей половины поля на половину противника?"
        //labelView.font = .systemFont(ofSize: 20)
        labelView.textColor = .white
        labelView.numberOfLines = 0
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.font = UIFont.preferredFont(forTextStyle: .body)
        labelView.adjustsFontForContentSizeCategory = true
        
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
    
    private var progressBar: UIProgressView = {
        let progress = UIProgressView()
        progress.progressViewStyle = .bar
        progress.progress = 0.5
        progress.tintColor = UIColor(hexString: "#273A5E")
        progress.trackTintColor = .lightGray
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.heightAnchor.constraint(equalToConstant: 10).isActive = true

        return progress
    }()
    
    //MARK: - Answer Button
    lazy private var answerAButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("A", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var answerBButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("B", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        
        return button
    }()
    
    lazy private var answerCButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("C", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        
        return button
    }()

    lazy private var answerDButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Rectangle blue"), for: .normal)
        button.setTitle("D", for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showResult), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Help Button
    lazy private var fiftyFifty: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "fiftyFifty"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(fiftyFiftyPressed), for: .touchUpInside)
        return button
    }()
    
    lazy private var hallHelp: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "hallHelp"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(hallHelpPressed), for: .touchUpInside)
        return button
    }()
    
    lazy private var rightToMistake: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "rightToMistake"), for: .normal)
        button.layer.cornerRadius = CGFloat(20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(callFriendPressed), for: .touchUpInside)
        return button
    }()
    
    private var takeCash: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = CGFloat(20)
        button.setBackgroundImage(UIImage(named: "takeCash"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        settingNavigationBar()
        initSubviews()
        setupConstraints()
        startGame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if game.level > 0 {
            game.nextLevel()
        }
    }
    
    func startGame() {
        questionLabel.text = game.currentQuestion.ask
        questionNumberLabel.text = "Question \(game.level)"
        scoreLabel.text = "\(game.currentQuestion.cost ?? "0") RUB"
        setTitleAnswer()
    }

    func setTitleAnswer() {
        let buttons = [answerAButton, answerBButton, answerCButton, answerDButton].shuffled()
        let answers = game.currentQuestion.wrongAnswers + [game.currentQuestion.correctAnswer]
        for (num, button) in buttons.enumerated() {
            button.setTitle(answers[num], for: .normal)
        }
        
        setTimer()
    }
    
    
    //MARK: - Func for Music and Timer
    func setTimer() {
        timer.invalidate()
        progressBar.progress = 0.0
        playSound()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "timerSound", withExtension: "mp3")
        timerSound = try! AVAudioPlayer(contentsOf: url!)
        timerSound.play()
    }
    
    func playCheckSound() {
        let check = Bundle.main.url(forResource: "checkAnswer", withExtension: "mp3")
        audioCheckAnswer = try! AVAudioPlayer(contentsOf: check!)
        audioCheckAnswer.play()
    }
    
    //Blink the button
    func animateButton(_ sender: UIButton, playing: Bool) {
        if playing {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.autoreverse, .repeat],
                           animations: { sender.alpha = 0.5 },
                           completion: nil)
        } else {
            UIView.animate(withDuration: 0.5,
                           animations: { sender.alpha = 1 },
                           completion: nil)
        }
    }

    @objc private func showResult(_ sender: UIButton) {
        let resultVC = ResultViewController(level: game.level, costQuestion: game.costQuestion)
        
        progressBar.progress = 0.0
        timer.invalidate()
        timerSound.stop()
        secondsPassed = 0
        
        // Blink the button
        animateButton(sender, playing: true)
        // music
        playCheckSound()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.animateButton(sender, playing: false)
    
            self?.audioCheckAnswer.stop()
            self?.navigationController?.pushViewController(resultVC, animated: true)
        }
    }

    @objc private func fiftyFiftyPressed() {
        let a = game.showFiftyFifty()
        let answers = [a.0, a.1]
        let buttons = [answerAButton, answerBButton, answerCButton, answerDButton]

        for button in buttons {
            if !answers.contains(button.currentTitle!) {
                button.isEnabled = false
                button.alpha = 0.5
            }
        }
    }

    @objc private func hallHelpPressed() {
        showAlert(title: "Зал выбрал ответ:", message: game.showHallHelp(persent: 70))
    }

    @objc private func callFriendPressed() {
        showAlert(title: "Друг считает что это:", message: game.showHallHelp(persent: 80))
    }
    
    private func settingNavigationBar() {
        navigationItem.backButtonTitle = "Назад"
    }
    
    private func initSubviews() {
        self.view.insertSubview(background, at: 0)
        self.view.addSubview(questionLabel)
        
        self.view.addSubview(questionNumberLabel)
        self.view.addSubview(scoreLabel)
        
        self.view.addSubview(progressBar)
        
        self.view.addSubview(answerAButton)
        self.view.addSubview(answerBButton)
        self.view.addSubview(answerCButton)
        self.view.addSubview(answerDButton)
        
        self.view.addSubview(fiftyFifty)
        self.view.addSubview(hallHelp)
        self.view.addSubview(rightToMistake)
        
        self.view.addSubview(takeCash)
    }
    
    @objc func updateCounter() {
        if secondsPassed < game.timeLevel {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(game.timeLevel)
        } else {
            timer.invalidate()
        }
    }
    
    
    //MARK: - Setup Constraints
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -7),
            questionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let labelStackView = UIStackView(arrangedSubviews: [questionNumberLabel, scoreLabel])
        labelStackView.axis = .horizontal
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 100
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 14),
            labelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            labelStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 10),
            progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        //Stack for Answer Button
        let answerStackView = UIStackView(arrangedSubviews: [answerAButton, answerBButton, answerCButton, answerDButton])
        answerStackView.axis = .vertical
        answerStackView.distribution = .fillEqually
        answerStackView.spacing = 30
        answerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(answerStackView)
        
        NSLayoutConstraint.activate([
            answerStackView.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
            answerStackView.heightAnchor.constraint(equalToConstant: 336),
            answerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            answerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        //Stack for Helps Button
        let helpStackView = UIStackView(arrangedSubviews: [fiftyFifty, hallHelp, rightToMistake])
        helpStackView.axis = .horizontal
        helpStackView.distribution = .fillEqually
        helpStackView.spacing = 10
        helpStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(helpStackView)

        NSLayoutConstraint.activate([
            helpStackView.topAnchor.constraint(equalTo: answerStackView.bottomAnchor, constant: 40),
            helpStackView.heightAnchor.constraint(equalToConstant: 80),
            helpStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            helpStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
 
        NSLayoutConstraint.activate([
            takeCash.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            takeCash.widthAnchor.constraint(equalToConstant: 50),
            takeCash.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Main Stack View Vertical
        let mainStackView = UIStackView(arrangedSubviews: [labelStackView, progressBar, answerStackView, helpStackView])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 30
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 14),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: takeCash.topAnchor, constant: -10)
        ])
    }
}
