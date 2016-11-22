//
//  FillInBlankWithGraphicViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 11/10/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

class FillInBlankWithGraphicViewController: UIViewController {
    
    @IBOutlet weak var picker1: UIPickerView!
    
    var pickerData1: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData1 = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        
        
        // Do any additional setup after loading the view.
    }
    
}
