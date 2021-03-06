//
//  ChooseCommandTableViewController.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/11/21.
//

import UIKit

class ChooseCommandTableViewController: UITableViewController {
    weak var commandController: ViewController?
    var commands = [Command]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Add Simple Commmands
        let ps = Command(friendlyName: "List all running programs.", rootCommand: "ps aux",
                         mustBeFirst: true, options: [])
        let less = Command(friendlyName: "Output to scrolling window.", rootCommand: "less",
                           mustBeFirst: false, options: [])
        commands.append(ps)
        commands.append(less)
        // Add Advanced Commands
        let count1 = SelectCommand(title: "Count", prefix: "",
                                   value: 0, friendlyValues: ["Letters",
                                                              "Lines",
                                                              "Words"],
                                   actualValues: ["-c",
                                                  "-1",
                                                  "-w"])
        let count = Command(friendlyName: "Count input words or lines", rootCommand: "wc",
                            mustBeFirst: false, options: [count1])
        let find1 = SelectCommand(title: "Start from", prefix: "",
                                  value: 0, friendlyValues: ["The current directory",
                                                             "Your home directory",
                                                             "The root directory",
                                                             "Somewhere else"],
                                  actualValues: [".",
                                                 "~",
                                                 "/",
                                                 "/path/to/your/directory"])
        let find2 = CheckCommand(title: "Ignore Case", prefix: "Filename",
                                 checkedCommand: "-iname", uncheckedCommand: "-name",
                                 value: false)
        let find3 = TextCommand(title: "Filename", prefix: "",
                                placeholder: "", isNumeric: false,
                                value: "")
        let find4 = CheckCommand(title: "Search subdirectories", prefix: "",
                                 checkedCommand: "", uncheckedCommand: "-maxdepth 1",
                                 value: false)
        let find5 = TextCommand(title: "Owner username", prefix: "-user",
                                placeholder: "", isNumeric: false,
                                value: "")
        let find = Command(friendlyName: "Find files by attribute", rootCommand: "find",
                           mustBeFirst: true, options: [find1, find2, find3, find4, find5])
        commands.append(count)
        commands.append(find)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commands.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cmd = commands[indexPath.row]
        
        cell.textLabel?.text = cmd.friendlyName
        cell.accessoryType = .disclosureIndicator
        if cmd.mustBeFirst {
            cell.textLabel?.textColor = .blue
        } else {
            cell.textLabel?.textColor = .black
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let command = commands[indexPath.row]
        commandController?.commandAdded(command)
        
        if command.options.isEmpty {
            navigationController?.popToRootViewController(animated: true)
        } else {
            let vc = EditCommandTableViewController(style: .grouped)
            vc.activeCommand = command
            
            if let first = navigationController?.viewControllers.first {
                navigationController?.setViewControllers([first, vc],
                                                         animated: true)
            }
        }
    }
    
}
