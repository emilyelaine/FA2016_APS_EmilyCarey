//
//  resultsViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 11/3/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
    
    @IBOutlet weak var exhibitName: UILabel!
    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    func setExhibitName(name: String) {
        exhibitName.text = name
    }
    func setChallengeResults() {
        var resultsResponse = ""
        if challengeAnswer == true {
            resultsResponse = "Correct! You are on your way to becoming an animal expert."
            tryAgainButton.isHidden = true
        }
        else {
            resultsResponse = "That is not correct.  Select Try Again to choose a different answer."
            tryAgainButton.isHidden = false
        }
        
        results.text = resultsResponse
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exhibitChallenge = exhibitID+"TestChallenge"
        //Gets the URL of the JSON File
        let url = Bundle.main.url(forResource: exhibitChallenge, withExtension:"json", subdirectory:"exhibits")
        
        //Kicks off Code to Transform JSON file into readable arrays
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            //Throws an error if JSON file is missing
            if error != nil {
                print (error)
            }
            else {
                //Gets the content of the JSON FILE
                if let content = data
                {
                    do
                    {
                        //Turns the JSON File into an array
                        let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        //Grabs all the exhibits
                        if let challenge = json["challenge"] as? NSDictionary
                        {
                            
                            //Grabs the selected exhibit.
                            print(level)
                            if let selectedLevel = challenge[level] as? NSDictionary
                            {
                                
                                if let choices = selectedLevel["choices"] as? Array<Any> {
                                    
                                    //Forces the UI to Reload right away
                                    DispatchQueue.main.async {
                                        //Runs the function that sets the Exhibit Name
                                        self.setExhibitName(name: challenge["exhibitName"] as! String)
                                        
                                        self.setChallengeResults()
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }
            
        }
        
        task.resume()
        
    }
}
