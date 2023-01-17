//
//  String + Extensions.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 17.01.2023.
//

import Foundation

extension String {
    
    func isValid() -> Bool {
        let format = "SELF MATCHES %@"
        let regularExpression = "[a-zA-Z0-9._]+@[a-zA-Z]\\.[a-zA-Z]{2,}"
        
        return NSPredicate(format: format, regularExpression).evaluate(with: self)
    }
    
}
