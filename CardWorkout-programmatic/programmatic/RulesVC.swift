//
//  RulesVC.swift
//  programmatic
//
//  Created by Emir Alkal on 8.05.2022.
//

import UIKit

class CWLabel: UILabel {
    init(text: String, size: CGFloat, weight: UIFont.Weight, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class RulesVC: UIViewController {

    let titleLabel = CWLabel(text: "Rules", size: 40, weight: .bold, alignment: .center)
    let rulesLabel = CWLabel(text: "The value of each card represent the number of exercise you do.\n\nJ = 11, Q = 12, K = 13, A = 14", size: 19, weight: .semibold, alignment: .center)
    let adviceLabel = CWLabel(text: "Test", size: 20, weight: .semibold, alignment: .left)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        view.addSubview(rulesLabel)
        // rulesLabel.lineBreakMode = .byWordWrapping // ?? i don't understand what that is
        rulesLabel.numberOfLines = 0
        
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        view.addSubview(adviceLabel)
        
        NSLayoutConstraint.activate([
            adviceLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 70),
            adviceLabel.widthAnchor.constraint(equalToConstant: 100),
            adviceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
