//
//  AllPicCollectionViewController.swift
//  PicTalkSwift
//
//  Created by Pak on 29/3/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import UIKit



class AllPicCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var mainView: UICollectionView!
    
    let dataSource = PicData()
    var blackView = UIView()
    var picCore = [[String:String]]()
    var selectedPicPath = [NSIndexPath]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.initialize()
        mainView.allowsMultipleSelection = true
            
        

        // Uncomment the following line to preserve selection between presentations
         //??????self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(AllPicCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
 

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.arrayCore.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("yellow", forIndexPath: indexPath) as! AllPicCollectionViewCell
         picCore = dataSource.arrayCore
        
        //content
        cell.labelNative.text = picCore[indexPath.item]["english"]
        cell.picCell.image = UIImage(named: picCore[indexPath.item]["file"]!)
        
        //style
        //print("Reuse cell: isPicInSentance: \(cell.isPicInSentance), index: \(indexPath)")
        if (cell.selected) {
            cell.labelNative.textColor = UIColor.whiteColor()
            cell.backgroundColor = themeColor
        } else{
            cell.labelNative.textColor = themeColor
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        self.blackView = UIView(frame: CGRect(origin: CGPointZero, size: collectionView.bounds.size))
        self.blackView.backgroundColor = UIColor.blackColor()
        self.blackView.tag = 0
        self.blackView.alpha = 0.2
        cell?.addSubview(self.blackView)
    }
    
    override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath)
        self.blackView.alpha = 0
    }
    


    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath) selected")
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AllPicCollectionViewCell{
            cell.labelNative.textColor = UIColor.whiteColor()
            cell.backgroundColor = themeColor
        }
       

        
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath) deselected")
    }

    
    
    
    func getCell(collectionView:UICollectionView, indexPath:NSIndexPath) -> AllPicCollectionViewCell? {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AllPicCollectionViewCell
        return cell
    }
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
