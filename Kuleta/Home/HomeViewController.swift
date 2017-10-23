//
//  HomeViewController.swift
//  Kuleta
//
//  Created by Erblin Berisha on 10/3/17.
//  Copyright © 2017 Erblin Berisha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var expenseSelected = true
    var controller : AddTransactionTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = AddTransactionTableViewController(nibName: "AddTransactionTableViewController", bundle: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Choose Action", message: "Choose Income or Expense", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Income", style: .default, handler: { [weak self] (UIAlertAction) in
            
            self?.expenseSelected = false
            self?.controller?.modalPresentationStyle = .popover
            let ppc = self?.controller?.popoverPresentationController
            ppc?.barButtonItem = self?.navigationItem.rightBarButtonItem
            self?.performSegue(withIdentifier: "addTransaction", sender: nil)
        }))
        alert.addAction(UIAlertAction(title: "Expense", style: .default, handler: { [weak self](UIAlertAction) in
            
            self?.expenseSelected = true
            self?.controller?.modalPresentationStyle = .popover
            let ppc = self?.controller?.popoverPresentationController
            ppc?.barButtonItem = self?.navigationItem.rightBarButtonItem
            self?.performSegue(withIdentifier: "addTransaction", sender: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Cancel touched")
        }))
        alert.modalPresentationStyle = .popover
        let ppc = alert.popoverPresentationController
        ppc?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        
        if let destination = destinationViewController as? AddTransactionTableViewController {
            if let popoverPresentationController = segue.destination.popoverPresentationController {
                popoverPresentationController.delegate = (self as? UIPopoverPresentationControllerDelegate)
            }
            destination.expenseTransaction = expenseSelected
        }
    }
}
