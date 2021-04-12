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
        if options.isEmpty {
            return ""
        }
        let title = options[0].title
        var extra = ""
        if let select = options[0] as? SelectCommand {
            extra = select.friendlyValues[select.value].lowercased()
            return "\(title) \(extra)"
        } else if let text = options[0] as? TextCommand {
            if text.value.isEmpty {
                extra = "(No value Sst)"
            } else {
                extra = text.value
            }
            return "\(title) \(extra)"
        } else if let check = options[0] as? CheckCommand {
            if check.value {
                return title
            } else {
                return "Don't \(title.lowercased())"
            }
        }
        return ""
    }
    var options: [CommandOption]
    
    
    func writeOutput() -> String {
        var output = ""
        
        if !rootCommand.isEmpty {
            output += rootCommand
        }
        
        for item in options {
            output += writeOutput(for: item)
            output += " "
        }
        
        return output
    }
    
    func writeOutput(for item: CommandOption) -> String {
        let root = item.prefix
        
        if let check = item as? CheckCommand {
            if check.value {
                if check.checkedCommand.isEmpty {
                    return ""
                }
                return "\(root)\(check.uncheckedCommand)"
            } else {
                if check.uncheckedCommand.isEmpty {
                    return ""
                }
                return "\(root)\(check.uncheckedCommand)"
            }
        } else if let select = item as? SelectCommand {
            return "\(root)\(select.actualValues[select.value])"
        } else if let text = item as? TextCommand {
            let trimmed = text.value.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed.isEmpty {
                return ""
            }
            return "\(root)\(trimmed)"
        } else {
            fatalError("Fatal Error: Unknown or incorrect command type.")
        }
    }
}
