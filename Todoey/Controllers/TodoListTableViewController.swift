//
//  ViewController.swift
//  Todoey
//
//  Created by Thomas Dato on 3/10/20.
//  Copyright © 2020 Tommy Dato. All rights reserved.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    var itemArray = [Item]()
        //["Look at documentation", "Roast some veggies", "Research trade in values"]
    
    let defaults = UserDefaults.standard
    let itemListKey = "TodoListArray"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let newItem = Item()
        newItem.title = "Look at documentation"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Roast some veggies"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Research trade in values"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: itemListKey) as? [Item] {
            itemArray = items
        }
        

    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // this will create a number of cells equal to the number of objects in the array
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        // ternary
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])

        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        
        tableView.reloadData()
        
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
                
                let newItem = Item()
                newItem.title = textField.text!
                
                self.itemArray.append(newItem)
                
                self.defaults.set(self.itemArray, forKey: self.itemListKey)
                
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

