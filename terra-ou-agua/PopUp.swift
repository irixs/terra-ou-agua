//
//  PopUp.swift
//  terra-ou-agua
//
//  Created by Hugo Santos on 03/09/20.
//  Copyright © 2020 Apple Academy UFPE. All rights reserved.
//

import UIKit

class Popup: UIView {
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Esse é o famoso 16 toneladas! Fala marujo!"
        
        return label
    }()
    
    fileprivate let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Caisse na agua, se lascou kkkkkk"
        
        return label
    }()
    
    fileprivate lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.frame = UIScreen.main.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
