//
//  PicData.swift
//  PicTalkSwift
//
//  Created by Pak on 31/3/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import Foundation


class PicData{
    let keys = ["english","swedish","arabic","file","category"]
    var allPics = NSArray()
    
    var arrayCore = [[String:String]]()
    var arrayHealth = [[String:String]]()
    
    
    var element = [String:String]()
    
    func initialize(){
        if let path = NSBundle.mainBundle().pathForResource("PicData", ofType:"plist"){
            if  let myDict = NSArray(contentsOfFile: path){
                allPics = myDict
            }
        }
        for pic in allPics {
            for key in keys{
               element.updateValue(pic.valueForKey(key) as! String, forKey: key)
            }
            
            switch pic.valueForKey("category") as! String {
            case  "Core":
                arrayCore.append(element)
            case  "Health":
                arrayHealth.append(element)
            //Feelings, Food, Shopping, Transportation
            default: break
            }
            
        }
        print(arrayCore.count)
    }
    
}