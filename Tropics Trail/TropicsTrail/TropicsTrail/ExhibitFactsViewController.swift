//
//  ExhibitFactsViewController.swift
//  TropicsTrail
//
//  Created by Emily Carey on 10/30/16.
//  Copyright © 2016 Emily Carey. All rights reserved.
//

import UIKit

class ExhibitFactsViewController: UIViewController {

    @IBOutlet weak var exhibitName: UILabel!
    @IBOutlet weak var exhibitImage: UIImageView!
    @IBOutlet weak var exhibitFacts: UILabel!
    @IBOutlet weak var exhibitOverview: UILabel!
    
    //Function To Set Copy and Images
    func setExhibitCopy(name: String) {
        
        exhibitName.text = name
    
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        //Gets the URL of the JSON File
        let url = Bundle.main.url(forResource: "exhibits", withExtension:"json", subdirectory:"json")
        
        //Kicks off Code to Transform JSON file into readable arrays
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            //Throws an error if JSON file is missing
            if error != nil
            {
                print (error)
            }
            else
            {
                //Gets the content of the JSON FILE
                if let content = data
                {
                    do
                    {
                        //Turns the JSON File into an array
                        let json = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject

                        //Grabs all the exhibits
                        if let exhibits = json["exhibits"] as? NSDictionary
                        {

                            //Grabs the selected exhibit. Right now it's hard coded as gibbons
                            //But in the future you will pass a variable set to the exhibit name
                            if let selectedExhibit = exhibits["gibbons"] as? NSDictionary
                            {
                                //Forces the UI to Reload right away
                                DispatchQueue.main.async {
                                    //Runs the function that sets the actual copy for the UI elements
                                    //You will have to add the remaining attributes and pass them to the function
                                    self.setExhibitCopy(name: selectedExhibit["name"] as! String)
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
