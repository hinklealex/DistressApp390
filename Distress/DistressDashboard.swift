//
//  DistressDashboard.swift
//  Distress
//
//  Created by Alex Hinkle on 12/6/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import UIKit
import Parse

class DistressDashboard: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    static var count = 0
    
    @IBOutlet weak var theCV: UICollectionView!
    
    
       
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
            let query = PFQuery(className:"DistressContacts")
           
            query.findObjectsInBackgroundWithBlock { (objects : [PFObject]?, error: NSError?) -> Void in
            if(objects != nil)
            {
                PhoneCore.distressData = objects!
                self.theCV.reloadData()
                print("Found")
                print(objects?.count)
                print(PhoneCore.distressData)
            }
            else
            {
                print("None Found")
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //override func viewWillAppear(animated: Bool)
    //{
      //  super.viewWillAppear(animated)
      //  self.theCV.reloadData()
    //}
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.theCV.reloadData()
        
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
