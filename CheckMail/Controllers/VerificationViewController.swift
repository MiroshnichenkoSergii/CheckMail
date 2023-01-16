//
//  VerificationViewController.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 12.01.2023.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
    }
    
}

//MARK: - Collection View Data Source

extension VerificationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell.idMailCell.rawValue, for: indexPath) as? MailCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
    }
}

//MARK: - Select Proposed Mail Protocol

extension VerificationViewController: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - Constraints

extension VerificationViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
}
