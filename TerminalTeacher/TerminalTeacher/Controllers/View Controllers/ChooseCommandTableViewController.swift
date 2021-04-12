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
        
        let ps = Command(friendlyName: "List all running programs.",
                         rootCommand: "ps aux",
                         mustBeFirst: true)
        let less = Command(friendlyName: "Output to scrolling window.",
                           rootCommand: "less",
                           mustBeFirst: false)
        commands.append(ps)
        commands.append(less)
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
        navigationController?.popToRootViewController(animated: true)
    }
    
}
