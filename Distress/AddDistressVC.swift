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
    
  
    @IBOutlet weak var messageTV: UITextView!
    @IBAction func saveButtonClicked(sender: AnyObject)
    {
        var message = ""
        
        if(self.nameTF.text!.characters.count == 0)
        {
            message = "You must enter a name"
        }
        else if(self.phoneTF.text!.characters.count == 0)
        {
            message = "You must enter a phone number"
        }
        else if(self.messageTV.text!.characters.count == 0)
        {
            message = "You must enter a message"
        }
        
        if(message.characters.count == 0)
        {
            //we can create the Message
            let obj = PFObject(className: "Message")
            obj.setValue(nameTF.text, forKey: "name")
            obj.setValue(phoneTF.text, forKey: "phone")
            obj.setValue(messageTV.text, forKey: "message_text")
            obj.setValue(PhoneCore.currentUser, forKey: "owner_id")
            obj.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                if(success)
                {
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                else
                {
                    PhoneCore.showAlert("Message Create Error", message: "Something went wrong during save!!!!", presentingViewController: self, onScreenDelay: 2.0)
                }
            
        

                })
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
