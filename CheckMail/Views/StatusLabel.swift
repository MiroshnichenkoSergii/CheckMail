//
//  StatusLabel.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 16.01.2023.
//

import Foundation
import UIKit

class StatusLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    private func configure() {
        text = "Check your mail"
        textColor = #colorLiteral(red: 0.9477203488, green: 0.9328324199, blue: 0.8551313281, alpha: 1)
        font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
