//
//  PhoneCore.swift
//  Distress
//
//  Created by Alex Hinkle on 12/6/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import UIKit
import Parse
import Alamofire

class PhoneCore: NSObject
{
    
    static var currentUser: PFUser!
    static var distressData  = [PFObject]()
    
    static func sendSMS(to: String, message: String)
    {
        let parameters = [
            "To": to,
            "From": "+15134492251",
            "Body": message
        ]
        
        Alamofire.request(.POST, "https://api.twilio.com/2010-04-01/Accounts/AC8c0ad4e9ba2cf521f1f442e46ac5d983/Messages.json", parameters: parameters, encoding: .URL).authenticate(user: "AC8c0ad4e9ba2cf521f1f442e46ac5d983", password: "7a11fcf620290c3d57f935e80d20b616")
    }
    
    static func showAlert(title: String, message: String, presentingViewController: UIViewController, onScreenDelay: Double)
    {
        let av = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        presentingViewController.presentViewController(av, animated: true, completion: { () -> Void in
            let delay = onScreenDelay * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                presentingViewController.dismissViewControllerAnimated(true, completion: nil)
            })
        })
        
    }
}