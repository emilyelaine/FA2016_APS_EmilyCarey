//
//  AgeSelectionViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 10/30/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

var level1Selection = false
var level2Selection = false
var level3Selection = false

class AgeSelectionViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func levelSelected(_ sender: AnyObject) {
        level1Selection = true
        if level1Selection == true {
            print("Level 1 is selected")
        }

    }
    
    @IBAction func levelSelected2(_ sender: AnyObject) {
        level2Selection = true
        if level2Selection == true {
            print("Level 2 is selected")
        }
    }
    @IBAction func levelSelected3(_ sender: AnyObject) {
        level3Selection = true
        if level3Selection == true {
            print("Level 3 is selected")
        }
    }
    
}
