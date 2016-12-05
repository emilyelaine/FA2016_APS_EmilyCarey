//
//  MapViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 10/30/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//


import UIKit

var exhibitID: String!

class MapViewController: UIViewController {
    
    @IBAction func exhibitGibbon(_ sender: AnyObject) {
        exhibitID = "lemurs"
        if exhibitID == "lemurs" {
            print("lemurs have been selected")
        }
    }
    @IBAction func exhibitCrocodile(_ sender: AnyObject) {
        exhibitID = "crocodiles"
    }
    @IBAction func exhibitLemur(_ sender: AnyObject) {
        exhibitID = "gibbons"
    }
    @IBAction func exhibitBird(_ sender: AnyObject) {
        exhibitID = "birds"
    }
    @IBAction func exhibitTropicalReef(_ sender: AnyObject) {
        exhibitID = "reef"
    }
    @IBAction func exhibitNocturnal(_ sender: AnyObject) {
        exhibitID = "nocturnal"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
}
