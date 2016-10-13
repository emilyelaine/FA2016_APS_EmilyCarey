//
//  ProductTableViewController.swift
//  Testing
//
//  Created by Emily Carey on 10/8/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = "Hello Friend"
        cell.imageView?.image = UIImage(named: "image-cell1")
        
        return cell
    }


}
