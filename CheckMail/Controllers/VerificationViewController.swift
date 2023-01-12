//
//  VerificationViewController.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 12.01.2023.
//

import UIKit

class VerificationViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var verificationButton: UIButton!
    
    @IBOutlet weak var mailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailCollectionView.delegate = self
        mailCollectionView.dataSource = self
    }

    @IBAction func verificationTapped(_ sender: UIButton) {
    }
    
}

extension VerificationViewController: UICollectionViewDelegate {
    
}

extension VerificationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mailCollectionView.dequeueReusableCell(withReuseIdentifier: "MailCell", for: indexPath)
        
        return cell
    }
    
}

