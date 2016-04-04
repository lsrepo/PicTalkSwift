//
//  PicData.swift
//  PicTalkSwift
//
//  Created by Pak on 31/3/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import Foundation


class PicData{
     // Need manual input
    let keys = ["english","swedish","arabic","file","category"]
    var allData = NSArray()
    
    var arrayCore = [[String:String]]()
    var arrayHealth = [[String:String]]()
    var allPic = [[String:String]]()
    var onePic = [String:String]()
    
    // Need manual input
    let allCategories = ["Core","Health", "Food", "Shopping", "Transportation","Daily life","Feelings"]
    var numberOfItems = [0,0,0,0,0,0,0] //7 categories
    
    func initialize(){
        print("dataSource initializing")
        if let path = NSBundle.mainBundle().pathForResource("PicData", ofType:"plist"){
            if  let myDict = NSArray(contentsOfFile: path){
                allData = myDict
            }
        }
        
        //Parse string to dictionary
        for data in allData {
            for key in keys{
               onePic.updateValue(data.valueForKey(key) as! String, forKey: key)
            }
            
            allPic.append(onePic)
        }
        
        //Count number of items in each categories
        for onePic in allPic{
            let category = onePic["category"]!
            let index = allCategories.indexOf(category)
            //print(category,index)
            numberOfItems[index!] += 1
            
        }
        
        
        print(numberOfItems)
    }
}