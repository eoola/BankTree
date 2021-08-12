//
//  Questions.swift
//  BankTree
//
//  Created by Emmanuel Ola on 8/12/21.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let topic: String
    let question: String
    let answer: String
    
    static var QuestionBank: [String] {
        return []
    }
}

let data = [
    [
    ]
]
