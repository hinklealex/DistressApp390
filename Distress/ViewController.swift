//
//  ViewController.swift
//  Distress
//
//  Created by Alex Hinkle on 12/4/15.
//  Copyright © 2015 Alex Hinkle. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    var count = 0
    
    @IBOutlet weak var theCV: UICollectionView!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCVCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.redColor()
        cell.theLabel.text = "blah"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
