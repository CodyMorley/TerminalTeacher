//
//  TextTableViewCell.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/12/21.
//

import UIKit

class TextTableViewCell: UITableViewCell, UITextFieldDelegate {
    let textField = UITextField()
    var textChangedAction: ((String) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self,
                            action: #selector(textFieldChanged),
                            for:.editingChanged)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.delegate = self
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            textField.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error: Storyboards Not Supported For Feature.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldChanged(sender: UITextField) {
        textChangedAction?(sender.text ?? "")
    }

}
