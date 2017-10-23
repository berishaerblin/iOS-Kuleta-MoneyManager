//
//  AddTransactionTableViewController.swift
//  Kuleta
//
//  Created by Erblin Berisha on 10/23/17.
//  Copyright © 2017 Erblin Berisha. All rights reserved.
//

import UIKit

class AddTransactionTableViewController: UITableViewController {
    
    var expenseTransaction: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // remove the cancel button if we are in a popover
        // but we should also put it back if we are not in a popover
        // and it got removed on a previous appearance
        if let popoverPresentationController = navigationController?.popoverPresentationController {
            if popoverPresentationController.arrowDirection != .unknown {
                navigationItem.leftBarButtonItem = nil
            }
        }
        
        /*
        
        // set the preferred content size
        // so that when we appear in a popover
        // we'll be a good size
        var size = tableView.minimumSize(forSection: 0)
        // adjust for the fact that we still want row 1 to be square
        // in this preferred size
        size.height -= tableView.heightForRow(at: IndexPath(row: 1, section: 0))
        size.height += size.width
        preferredContentSize = size
 
         */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Expense Selected: \(expenseTransaction)")
    }
    
    // MARK: UITableViewDelegate
    
    // we want the face at row 1 to be as big as possible
    // since the face is round, we'll make that row be square
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 1 {
//            return tableView.bounds.size.width
//        } else {
//            return super.tableView(tableView, heightForRowAt: indexPath)
//        }
//    }
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
