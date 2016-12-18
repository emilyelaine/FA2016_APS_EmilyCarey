//
//  ChallengeViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 10/31/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

    var level = ""

    let exhibitChallenge = exhibitID+"TestChallenge"
    var MultiChoice1Answer = 0
    var MultiChoice2Answer = 0
    var MultiChoice3Answer = 0
    var MultiChoice4Answer = 0
    var challengeAnswer = false


class ChallengeViewController: UIViewController {

    @IBOutlet weak var exhibitName: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var MultiChoice1: UIButton!
    @IBOutlet weak var MultiChoice2: UIButton!
    @IBOutlet weak var MultiChoice3: UIButton!
    @IBOutlet weak var MultiChoice4: UIButton!
    
    
    // Set Level Selection based initial choice
    
    func setChallengeCopy(name: String, question: String, choice1: Array<Any>, choice2: Array<Any>, choice3: Array<Any>, choice4: Array<Any>) {
        exhibitName.text = name
        QuestionLabel.text = question
        MultiChoice1.setTitle((choice1[0] as! String),for: .normal)
        print(choice1[1])
        let MultiChoice1Answer = choice1[1]
        MultiChoice2.setTitle((choice2[0] as! String),for: .normal)
        let MultiChoice2Answer = choice2[1]
        MultiChoice3.setTitle((choice3[0] as! String),for: .normal)
        let MultiChoice3Answer = choice3[1]
        MultiChoice4.setTitle((choice4[0] as! String),for: .normal)
        let MultiChoice4Answer = choice4[1]

        
        QuestionLabel.frame = CGRect(x:exhibitName.frame.origin.x,y:exhibitName.frame.origin.y + exhibitName.frame.size.height+50,width:QuestionLabel.frame.size.width,height:QuestionLabel.frame.size.height)
        
        QuestionLabel.sizeToFit()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if level1Selection == true {
            level = "level1"
        }
        
        if level2Selection == true {
            level = "level2"
        }
        
        if level3Selection == true {
            level = "level3"
        }
        
        
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
                                        //Runs the function that sets the actual copy for the UI elements
                                        self.setChallengeCopy(name: challenge["exhibitName"] as! String, question: selectedLevel["question"] as! String, choice1: choices[0] as! Array, choice2: choices[1] as! Array, choice3: choices[2] as! Array, choice4: choices[3] as! Array)
                                        
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
    @IBAction func MultiChoice1Selected(_ sender: Any) {
        if MultiChoice1Answer == 0 {
            print("That is Correct!")
            challengeAnswer = true
        }
        else {
            print("That is not Correct.  Try Again!")
        }
    }
    
    @IBAction func MultiChoice2Selected(_ sender: Any) {
        if MultiChoice2Answer == 0 {
            print("That is Correct!")
            challengeAnswer = true
        }
        else {
            print("That is not Correct.  Try Again!")
        }
    }
    
    @IBAction func MultiChoice3Selected(_ sender: Any) {
        if MultiChoice3Answer == 0 {
            print("That is Correct!")
            challengeAnswer = true
        }
        else {
            print("That is not Correct.  Try Again!")
        }
    }
    
    @IBAction func MultiChoice4Selected(_ sender: Any) {
        if MultiChoice4Answer == 0 {
            print("That is Correct!")
            challengeAnswer = true
        }
        else {
            print("That is not Correct.  Try Again!")
        }
    }
    
    }
//function to Choose Challenge View Controller
