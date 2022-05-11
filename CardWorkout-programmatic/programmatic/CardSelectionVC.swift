//
//  CardSelectionVC.swift
//  programmatic
//
//  Created by Emir Alkal on 8.05.2022.
//

import UIKit

class CardSelectionVC: UIViewController {

    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton = CWButton(backgroundColor: .systemYellow, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards = Deck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()!
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureOtherButtons()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        NSLayoutConstraint.activate([
            
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
        ])
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    func configureOtherButtons() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 110),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
        
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRules), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 110),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.centerYAnchor.constraint(equalTo: resetButton.centerYAnchor),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor)
        ])
    }
    
    @objc func resetButtonPressed() {
        timer.invalidate()
        startTimer()
    }
        
    @objc func presentRules() {
        present(RulesVC(), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
