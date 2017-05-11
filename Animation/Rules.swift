//
//  Rules.swift
//  Canvas
//
//  Created by Andy-E on 2017-05-09.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class Rules {
    
    var predeceser : Character
    var probSec : [Int]
    var secseceser : [String]
    
    public init (predeceser : Character, secseceser : [String], probSec : [Int]){
        self.predeceser = predeceser
        self.secseceser = secseceser
        self.probSec = probSec
    }
    
    
    //NEEDS TESTING
    func chooseSecseceser () -> String { //this func is to choose secsescesser with proper probabilty
        var choosenSec = "" //might be problem
        var denomintor : Int = 0
        
        
        for number in probSec {
            denomintor += number
        }
        
        let randomVal = arc4random_uniform(UInt32(denomintor))
        var intRandomVal = Int(randomVal)
        var count = 0
        
        for  number in probSec { //this will break due to un even incremenation
            //one second though it might now 
            
            intRandomVal += -number //subtracks to see where it ends
            if intRandomVal < 0 { //returns value if stumbles on randnum
                break
            }
            count += 1
        }
        choosenSec = secseceser[count]
        return choosenSec
    }
    
}
