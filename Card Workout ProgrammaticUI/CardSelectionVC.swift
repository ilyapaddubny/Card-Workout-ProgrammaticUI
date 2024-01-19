//
//  CardSelectionVC.swift
//  Card Workout ProgrammaticUI
//
//  Created by Ilya Paddubny on 19.01.2024.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var timer: Timer!
    let cards = Card.allValues
    
    let cardImageView = UIImageView()
    let stopButton = CWButton(color: .red, title: "Stop", systemImageName: "stop.circle")
    let resetButton = CWButton(color: .lightGray, title: "Reset", systemImageName: "repeat.circle")
    let rulesButton = CWButton(color: .brown, title: "Rules", systemImageName: "info.circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTimer()
    }
    //    MARK: - Logic
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCardImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCardImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @objc func resetTimer() {
        timer.invalidate()
        startTimer()
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    
    //    MARK: - UI
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor, constant: 0),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(pesentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 0),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func pesentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
    
    
}
