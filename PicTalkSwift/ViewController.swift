//
//  ViewController.swift
//  PicTalkSwift
//
//  Created by Pak on 29/3/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        if let path = NSBundle.mainBundle().pathForResource("PicData", ofType:"plist"){
            if  let myDict = NSArray(contentsOfFile: path){
                print(myDict[0].valueForKey("category"))
            }
        }
    }


}

