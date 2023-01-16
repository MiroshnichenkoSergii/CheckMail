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
    private let collectionView = MailCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextField,
                                                               verificationButton,
                                                               collectionView],
                                             axis: .vertical,
                                             spacing: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setDelegates()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(statusLabel)
        view.addSubview(stackView)
        
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
        mailTextField.textFieldDelegate = self
    }
    
    @objc private func verificationButtonTapped() {
        print("button tapped")
    }
}

//MARK: - Collection View Data Source

extension VerificationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IdCell.idMailCell.rawValue, for: indexPath) as? MailCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
    }
}

//MARK: - Select Proposed Mail Protocol

extension VerificationViewController: SelectProposedMailProtocol {
    func selectProposedMail(indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - Actions Mail Text Field Protocol

extension VerificationViewController: ActionsMailTextFieldProtocol {
    
    func typingText(text: String) {
        print(text)
    }
    
    func cleanOutTextField() {
        print("clear")
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
        
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}
