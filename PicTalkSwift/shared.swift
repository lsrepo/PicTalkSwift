//
//  shared.swift
//  PicTalkSwift
//
//  Created by Pak on 3/4/2016.
//  Copyright © 2016 Pak. All rights reserved.
//

import Foundation

class shared{
    static let sharedInstance = shared()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    let dataSource = PicData();
    var arraySentence = [Int]()
}

let share = shared()
