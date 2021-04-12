//
//  ViewController.swift
//  TerminalTeacher
//
//  Created by Cody Morley on 4/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var output: UILabel!
    
    var commands = [Command]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addCommand))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cmd = commands[indexPath.row]
        
        cell.textLabel?.text = cmd.friendlyName
        cell.detailTextLabel?.text = cmd.summary
        
        if cmd.mustBeFirst {
            cell.textLabel?.textColor = UIColor.blue
        } else {
            cell.textLabel?.textColor = nil
        }
        return cell
    }
    
    @objc func addCommand() {
        let vc = ChooseCommandTableViewController(style: .plain)
        vc.commandController = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func commandAdded(_ command: Command) {
        commands.append(command)
    }
}

