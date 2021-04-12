//
//  SelectCommand.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import Foundation

class SelectCommand: CommandOption {
    var title: String
    var prefix: String
    
    var value: Int
    var friendlyValues: [String]
    var actualValues: [String]
    
    
    init(title: String,
         prefix: String,
         value: Int,
         friendlyValues: [String],
         actualValues: [String]) {
        
        self.title = title
        self.prefix = prefix
        self.value = value
        self.friendlyValues = friendlyValues
        self.actualValues = actualValues
    }
}
