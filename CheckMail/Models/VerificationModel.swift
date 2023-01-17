//
//  VerificationModel.swift
//  CheckMail
//
//  Created by Sergii Miroshnichenko on 17.01.2023.
//

import Foundation

class VerificationModel {
    
    private let mailsArray = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@hotmail.co.uk", "@msn.com", "@outlook.com", "@aol.com"]
    
    public var nameMail = String()
    public var filteredMailArray = [String]()
    
    private func filteringMails(text: String) {
        
        var domainMail = String()
        filteredMailArray = []
        
        guard let firstIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let range = text[firstIndex...endIndex]
        domainMail = String(range)
        
        mailsArray.forEach { mail in
            if mail.contains(domainMail) {
                if !filteredMailArray.contains(mail) {
                    filteredMailArray.append(mail)
                }
            }
        }
    }
    
    private func deriveNameMail(text: String) {
        guard let atSymbolIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: atSymbolIndex)
        let firstIndex = text.startIndex
        let range = text[firstIndex...endIndex]
        
        nameMail = String(range)
    }
    
    public func getFiltredMail(text: String) {
        filteringMails(text: text)
    }
    
    public func getMailName(text: String) {
        deriveNameMail(text: text)
    }
}
