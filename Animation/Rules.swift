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
    var secseceser : [Int : String]
    
    public init (predeceser : Character, secseceser : [Int : String]){
        self.predeceser = predeceser
        self.secseceser = secseceser
    }
    
    func chooseSecseceser () -> String { //this func is to choose secsescesser with proper probabilty
        var choosenSec : String
        var denomintor : Int = 0
        for (number, value) in secseceser {
            denomintor += number
        }
        let randomVal = arc4random_uniform(UInt32(denomintor))
        let intRandomVal = Int(randomVal)
        var count = 0
        
        for (_, value) in secseceser {
            if count == intRandomVal
            {
               choosenSec = value
            }
            count += 1
        }
        return choosenSec
    }
}
