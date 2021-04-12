//
//  CheckCommand.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import Foundation

class CheckCommand: CommandOption {
    var title: String
    var prefix: String
    
    var checkedCommand: String
    var uncheckedCommand: String
    var value: Bool
    
    init(title: String,
         prefix: String,
         checkedCommand: String,
         uncheckedCommand: String,
         value: Bool) {
        
        self.title = title
        self.prefix = prefix
        self.checkedCommand = checkedCommand
        self.uncheckedCommand = uncheckedCommand
        self.value = value
    }
}
