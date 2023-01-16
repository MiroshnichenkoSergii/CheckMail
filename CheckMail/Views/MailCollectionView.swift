//
//  MailCollectionView.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 16.01.2023.
//

import Foundation
import UIKit

enum idCell: String {
    case idMailCell
}

class MailCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: idCell.idMailCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
    }
}
