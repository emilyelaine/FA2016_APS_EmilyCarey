//
//  MapViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 10/30/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//


import UIKit

var mapLemur = false
var mapCrocodile = false
var mapGibbon = false
var mapBird = false
var mapTropicalReef = false
var mapNocturnal = false

class MapViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func lemurSelected(_ sender: AnyObject) {
        mapLemur = true
        if mapLemur == true {
            print("Lemur is Selected")
        }
    }
    @IBAction func crocodileSelected(_ sender: AnyObject) {
        mapCrocodile = true
        if mapCrocodile == true {
            print("Crocodile is Selected")
        }
    }
    @IBAction func gibbonSelected(_ sender: AnyObject) {
        mapGibbon = true
        if mapGibbon == true {
            print("Gibbon is Selected")
        }
    }
    @IBAction func birdSelected(_ sender: AnyObject) {
        mapBird = true
        if mapBird == true {
            print("Bird is Selected")
        }
    }
    @IBAction func tropicalReefSelected(_ sender: AnyObject) {
        mapTropicalReef = true
        if mapTropicalReef  == true {
            print("Tropical Reef is Selected")
        }
    }
    @IBAction func nocturnalSelected(_ sender: AnyObject) {
        mapNocturnal = true
        if mapNocturnal == true {
            print("Nocturnal is Selected")
        }
    }
    
    
    
}
