//
//  ViewController.swift
//  Todoey
//
//  Created by Thomas Dato on 3/10/20.
//  Copyright © 2020 Tommy Dato. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var itemArray = ["Look at documentation", "Roast some veggies", "Research trade in values"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // this will create a number of cells equal to the number of objects in the array
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
       
        
        if ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
             tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // action for when user presses the add bar button
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen once the user clicks the Add Item button on the UIAlert
            if let text = textField.text {
                if (text == "") {
                    return
                }
                self.itemArray.append(text)
                self.tableView.reloadData()
            }
            
        }
        
        alert.addTextField() { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

