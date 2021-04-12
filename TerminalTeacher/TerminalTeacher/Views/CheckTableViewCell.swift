//
//  CheckTableViewCell.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import UIKit

class CheckTableViewCell: UITableViewCell {
    let toggle = UISwitch()
    var switchChangedAction: ((Bool) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        toggle.addTarget(self,
                         action: #selector(switchChanged),
                         for: .valueChanged)
        toggle.sizeToFit()
        accessoryView = toggle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error: Storyboards Not Supported For Feature.")
    }
    
    @objc func switchChanged() {
        switchChangedAction?(toggle.isOn)
    }
}
