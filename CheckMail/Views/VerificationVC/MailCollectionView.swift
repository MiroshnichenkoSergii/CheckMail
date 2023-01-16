//
//  MailCollectionView.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 16.01.2023.
//

import Foundation
import UIKit

protocol SelectProposedMailProtocol: AnyObject {
    func selectProposedMail(indexPath: IndexPath)
}

enum idCell: String {
    case idMailCell
}

class MailCollectionView: UICollectionView {
    
    weak var selectMailDelegate: SelectProposedMailProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        configure()
        
        register(MailCollectionViewCell.self, forCellWithReuseIdentifier: idCell.idMailCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .none
        delegate = self
    }
}

//MARK: - Collection View Delegate

extension MailCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectMailDelegate?.selectProposedMail(indexPath: indexPath)
    }
}

extension MailCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2, height: 40)
    }
}
