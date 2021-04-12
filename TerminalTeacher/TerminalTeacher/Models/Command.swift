//
//  Command.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/11/21.
//

import Foundation

struct Command {
    var friendlyName: String
    var rootCommand: String
    var mustBeFirst: Bool
    var summary: String {
        "Summary here"
    }
    var options: [CommandOption]
}
