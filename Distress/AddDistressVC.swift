//
//  AddDistressVC.swift
//  Distress
//
//  Created by Alex Hinkle on 12/6/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import UIKit
import Parse

class AddDistressVC: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var messageTF: UITextField!
    
    @IBAction func saveButtonClicked(sender: AnyObject)
    {
        let distress = PFObject(className: "DistressContacts")
        
        distress["name"] = self.nameTF.text!
        distress["phone"] = self.phoneTF.text!
        distress["message"] = self.messageTF.text!
        distress.saveInBackgroundWithBlock{(success: Bool, error: NSError?) -> Void in
            if (success)
            {
                print("Object has been saved")
                DistressDashboard.count++
               
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        
            
        

    }

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.nameTF.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
