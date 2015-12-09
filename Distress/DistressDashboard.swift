//
//  DistressDashboard.swift
//  Distress
//
//  Created by Alex Hinkle on 12/6/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import UIKit
import Parse
import Alamofire


class DistressDashboard: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    var accountSID = "AC8c0ad4e9ba2cf521f1f442e46ac5d983"
    var authTokn = "7a11fcf620290c3d57f935e80d20b616"
    var appSID = "APa836aabf6ae5b22e288973953453c98b"
    
    
   
    static var count = 0
    
    @IBOutlet weak var theCV: UICollectionView!
    
    func getDataFromParse()
    {
        
        let query = PFQuery(className:"Message")
        query.whereKey("owner_id", equalTo: PhoneCore.currentUser)
        query.findObjectsInBackgroundWithBlock { (objects : [PFObject]?, error: NSError?) -> Void in
            if(objects != nil)
            {
                PhoneCore.distressData = objects!
                self.theCV.reloadData()
                print("Found")
                print(objects?.count)
                //print(PhoneCore.distressData)
            }
            else
            {
                print("None Found")
            }
        }

    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        //print("Slelected at indexPath: \(indexPath.row)")
        //f(indexpath == PhoneCore.distressData.indexOf(<#T##element: PFObject##PFObject#>))
    }
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        print("Slelected at indexPath: \(indexPath.row)")
        
        print(PhoneCore.distressData[indexPath.row]["phone"])
        print(PhoneCore.distressData[indexPath.row]["message_text"])
        PhoneCore.sendSMS("\(PhoneCore.distressData[indexPath.row]["phone"])", message: "\(PhoneCore.distressData[indexPath.row]["message_text"])")
        
        return true
    }
    
    func sendMessage()
    {
        
    }
    
    
    
    override func viewDidLoad()
        
    {
        
        super.viewDidLoad()
        getDataFromParse()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        getDataFromParse()
        
        }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return PhoneCore.distressData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCVCell
        
        let nameHolder = PhoneCore.distressData[indexPath.row].valueForKey("name")!
        // Configure the cell
        cell.backgroundColor = UIColor.redColor()
        cell.theLabel.text = "\(nameHolder)"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
}
