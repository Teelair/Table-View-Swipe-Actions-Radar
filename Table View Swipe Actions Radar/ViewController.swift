//
//  ViewController.swift
//  Table View Swipe Actions Radar
//
//  Created by Tyler R on 5/1/19.
//  Copyright © 2019 Tyler R. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
    
    override var keyCommands: [UIKeyCommand]? {
        let fakeUpdateKeyCommand = UIKeyCommand(input: "f", modifierFlags: .command, action: #selector(fakeUpdate), discoverabilityTitle: "Fake Update")
        let printButtonWidthsKeyCommand = UIKeyCommand(input: "d", modifierFlags: .command, action: #selector(printButtonWidths), discoverabilityTitle: "Print Button Widths")
        
        return [fakeUpdateKeyCommand, printButtonWidthsKeyCommand]
    }
    
    @objc func fakeUpdate() {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        printButtonWidths()
    }
    
    @objc func printButtonWidths() {
        print("Printing widths of swipe buttons")
        for subview in self.tableView.subviews {
            for subsubview in subview.subviews {
                if subsubview is UIButton {
                    print("- Swipe button view:", subsubview)
                    print("--- Swipe button width:", subsubview.frame.size.width)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .lightGray
        cell.textLabel?.text = "Swipe left on me!"
        return cell
    }
    
    func configurationForCell() -> UISwipeActionsConfiguration {
        let actionOne = UIContextualAction(style: .normal, title: "One") { (_, _, _) in
            print("Action one pressed")
        }
        actionOne.backgroundColor = .red
        let actionTwo = UIContextualAction(style: .normal, title: "Two") { (_, _, _) in
            print("Action two pressed")
        }
        actionTwo.backgroundColor = .init(red: 226/255.0, green: 196/255.0, blue: 2/255.0, alpha: 1)
        let actionThree = UIContextualAction(style: .normal, title: "Three") { (_, _, _) in
            print("Action three pressed")
        }
        actionThree.backgroundColor = .init(red: 1/255.0, green: 155/255.0, blue: 24/255.0, alpha: 1)
        let actionFour = UIContextualAction(style: .normal, title: "Four") { (_, _, _) in
            print("Action four pressed")
        }
        actionFour.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [actionFour, actionThree, actionTwo, actionOne])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return self.configurationForCell()
    }
}
