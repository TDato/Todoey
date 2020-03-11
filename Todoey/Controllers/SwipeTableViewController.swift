//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Thomas Dato on 3/11/20.
//  Copyright © 2020 Tommy Dato. All rights reserved.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adjust height for delete swipe image
        tableView.rowHeight = 70.0
    }
    
    //MARK: - TableView DataSource Methods
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
            
            cell.delegate = self
        
            return cell
    }

    // Responsible for handling what happens when the user swipes on the cells
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            self.updateModel(at: indexPath)
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")


        return [deleteAction]
    }
    
    // Customizable swipe behavior
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }

    func updateModel(at indexPath: IndexPath) {
        // update the datamodel
    }
    
    func updateNavBarColor(_ backgroundColor: UIColor) {
        guard let navBar = navigationController?.navigationBar else { fatalError("NavigationController does not exist") }
        
        let contrastOfBackgroundColor = ContrastColorOf(backgroundColor, returnFlat: true)
                
        // Small title colors: (also shown when large title collapses by scrolling down)
        navBar.barTintColor = backgroundColor
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Large title colors:
        navBar.backgroundColor = backgroundColor
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Color the back button and icons: (both small and large title)
        navBar.tintColor = contrastOfBackgroundColor
    }
}
