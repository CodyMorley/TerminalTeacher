//
//  TextCommand.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import Foundation


class TextCommand: CommandOption {
    var title: String
    var prefix: String
    
    var placeholder: String
    var isNumeric: Bool
    var value: String
    
    init(title: String,
         prefix: String,
         placeholder: String,
         isNumeric: Bool,
         value: String) {
        
        self.title = title
        self.prefix = prefix
        self.placeholder = placeholder
        self.isNumeric = isNumeric
        self.value = value
    }
}
