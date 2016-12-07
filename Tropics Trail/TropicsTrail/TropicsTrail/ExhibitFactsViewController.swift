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
    @IBOutlet weak var exhibitOverview: UILabel!
    @IBOutlet weak var exhibitFacts: UILabel!
 //   @IBAction func challengeType(_ sender: AnyObject) {
   //     let viewControllerSelected = self.pushViewController(MainContentViewController, animated: true)
   // }


    //Function To Set Copy and Images
    var facts = "Some text"

    func setExhibitCopy(name: String, overview: String, image: String, facts: Array<Any>) {
        exhibitName.text = name
        exhibitOverview.text = overview
        exhibitOverview.sizeToFit()
        
        //factCopy is an empty string to be populated with the facts
        var factCopy = ""
        
        //This creates the loop that appends each fact to fact copy. var fact is created in the initializing of the loop, and factCopy
        //refereneces itself to make sure we are adding to the list, not overwriting the previous fact.
        //"• " is used to add a bullet point before each fact
        //"\n" adds a line break after each fact
        //Both may be changed or removed as you see fit
        for fact in facts {
            factCopy = factCopy+"• "+(fact as! String)+"\n"
        }
        
        //This line adds the copy to the facts lable after the loop has completed.
        exhibitFacts.text = factCopy


        //This line of code places the Exhibit Facts below the Exhibit Overview by redrawing it based on it's own location and the bottom of the Overview
        exhibitFacts.frame = CGRect(x:exhibitFacts.frame.origin.x,y:exhibitOverview.frame.origin.y + exhibitOverview.frame.size.height,width:exhibitFacts.frame.size.width,height:exhibitFacts.frame.size.height)


        //This line then streches the fact label to fit its content
        exhibitFacts.sizeToFit()


        //This line sets the Exhibit Image to the image passed to the function
        exhibitImage.image = UIImage(named:image)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //Gets the URL of the JSON File
        let url = Bundle.main.url(forResource: "exhibitPage", withExtension:"json", subdirectory:"exhibits")

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
                        if let exhibits = json["exhibits"] as? NSDictionary
                        {
                            //Grabs the selected exhibit.
                            print(exhibitID)
                            if let selectedExhibit = exhibits[exhibitID] as? NSDictionary
                            {

                                //Forces the UI to Reload right away
                                DispatchQueue.main.async {
                                    //Runs the function that sets the actual copy for the UI elements
                                    //You will have to add the remaining attributes and pass them to the function
                                    self.setExhibitCopy(name: selectedExhibit["name"] as! String, overview: selectedExhibit["overview"] as! String, image: selectedExhibit["image"] as! String, facts: selectedExhibit["facts"] as! Array)

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
    //function to Choose Challenge View Controller


   // func buttonChallengeClicked() {
     //   if challengeType:select(<#T##sender: Any?##Any?#>) print("challenge type is chosen")
    //}
