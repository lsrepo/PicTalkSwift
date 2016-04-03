//: Playground - noun: a place where people can play

import UIKit

let keys = ["english","swedish","arabic","file","category"]
var allPics = NSArray()

var arrayCore = [[String:String]]()
var arrayHealth = [[String:String]]()


var element = [String:String]()



if let path = NSBundle.mainBundle().pathForResource("PicData", ofType:"plist"){
    if  let myDict = NSArray(contentsOfFile: path){
        print(myDict[0].valueForKey("category"))
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

arrayCore[0]