//
//  Alerts.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 18.01.2023.
//

import Foundation
import UIKit

struct Alerts {
    
    private static func showSimpleAlert(vc: UIViewController, title: String, message: String) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            vc.present(ac, animated: true, completion: nil)
        }
    }
    
    private static func showChangeAlert(vc: UIViewController, title: String, message: String, completion: @escaping() -> Void) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default) {_ in
            completion()
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        DispatchQueue.main.async {
            vc.present(ac, animated: true, completion: nil)
        }
    }
    
    static func showResultAlert(vc: UIViewController, message: String) {
        showSimpleAlert(vc: vc, title: "Result", message: message)
    }
    
    static func showErrorAlert(vc: UIViewController, message: String, completion: @escaping() -> Void) {
        showChangeAlert(vc: vc, title: "Error", message: message, completion: completion)
    }
}
