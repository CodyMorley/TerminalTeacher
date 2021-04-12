//
//  CommandOption.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import Foundation

protocol CommandOption {
    var title: String { get }
    var prefix: String { get }
}
