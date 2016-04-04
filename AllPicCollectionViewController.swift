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
    
    let dataSource = share.dataSource
    var blackView = UIView()
    var selectedPicPath = [NSIndexPath]()
    var arrayCategory = [[String:String]]()
    var currentCategoryIndex:Int{
        return 0
    }
    var indexOffset:Int {
        get {
            var accumulateIndex = 0
            for index in 0..<currentCategoryIndex{
                accumulateIndex += share.dataSource.numberOfItems[index]
            }
            return accumulateIndex
        }
    }


    
    override func viewDidLoad() {
        print("Loading Cat 1")
        
        super.viewDidLoad()
        let currentCategory = share.dataSource.allCategories[currentCategoryIndex]
        getCurrentArray(currentCategory)
        
        //Get indexOffset
        print("indexOffset:\(indexOffset)")
        
       
       
    }
    
    override func viewWillAppear(animated: Bool) {
        //Set Multiple selection in CollectionView
        mainView.allowsMultipleSelection = true
        
        //Set title in Tab bar
        let currentCategory = share.dataSource.allCategories[currentCategoryIndex]
        let presentVC = self.parentViewController
        presentVC?.title = currentCategory
        print("viewWillAppear, reload data")
        self.collectionView?.reloadData()
        
        //re-set selected value
//        for index in share.arraySentence{
//            if ( 0 <= arrayCategory.count &&  index < arrayCategory.count + indexOffset){
//                let cell = collectionView!.cellForItemAtIndexPath(index) as? AllPicCollectionViewCell
//            }
//        }
        
        
        
    }
    
    func getCurrentArray(currentCategory:String){
        print("Getting Current Array with currentCategory:\(currentCategory)")
        if (arrayCategory.count > 0){
            arrayCategory.removeAll()
        }
        for onePic in dataSource.allPic{
            
            if (onePic["category"] == currentCategory){
                arrayCategory.append(onePic)
            }
        }
     
        
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
        return arrayCategory.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("picCell", forIndexPath: indexPath) as! AllPicCollectionViewCell
        
        

        cell.labelNative.text = arrayCategory[indexPath.row]["english"]
        cell.picCell.image = UIImage(named: arrayCategory[indexPath.row]["file"]!)
        
        //style
        let found = share.arraySentence.contains(indexPath.row + indexOffset)
        if (found) {
            createSelectedStyle(cell)
            // I just fix it
            cell.selected = true
            //Tell collectionView: "Hey, I fixed it for you"
            collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.None)
            
            
        } else{
            removeSelectedStyle(cell)
            //cell.selected = false
        }
        
        //print("building cell: \(cell.selected)")
        
        return cell
    }
    
    func createSelectedStyle(cell:AllPicCollectionViewCell){
        cell.labelNative.textColor = UIColor.whiteColor()
        cell.backgroundColor = themeColor
    }
    
    func removeSelectedStyle(cell:AllPicCollectionViewCell){
        cell.labelNative.textColor = themeColor
        cell.backgroundColor = UIColor.whiteColor()
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
    

    // MARK: Select and Deselect
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("selecting")
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AllPicCollectionViewCell{
            createSelectedStyle(cell)
            print(cell.selected)
        }
        
        let index = indexPath.item + indexOffset
        share.arraySentence.append(index)
        
        

    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("deselecting")
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AllPicCollectionViewCell{
            removeSelectedStyle(cell)
            print(cell.selected)
        }
        
        //Remove All Items of this pic in the sentence
        let index = indexPath.item + indexOffset
        repeat{
            let indexFound = share.arraySentence.indexOf(index)
            share.arraySentence.removeAtIndex(indexFound!)
        }
        while ( share.arraySentence.indexOf(index) != nil )
        
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
