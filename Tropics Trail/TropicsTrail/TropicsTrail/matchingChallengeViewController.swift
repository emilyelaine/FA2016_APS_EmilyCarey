//
//  matchingChallengeViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 11/9/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

class matchingChallengeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSize(width: 375, height: 1150)
    }
        
        
        
        // Do any additional setup after loading the view.
    }
    
