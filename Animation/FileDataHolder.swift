//
//  FileDataHolder.swift
//  Canvas
//
//  Created by Andy-E on 2017-05-26.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class DataHolder {
    
    var unParsedValue : [String]
    
    
    public struct KeyValues {
        var description : String
        var angleValue : Float
        var axiom : String
        var rules : [Rules]
    }
    
    
    
    public init (unParsedValue : [String]){
        self.unParsedValue = unParsedValue
        
        parseDes(values: unParsedValue)
        //Parce makes a array of key values
        
        
    }
    
    func parseDes(values : [String]) {
        for singleValues in values {
            //print(singleValues)
            //print("Result: \(singleValues.commonPrefix(with: "angle"))")
           // if (singleValues.commonPrefix(with: "angle") == "angle") { //detects when if find angle in a word
            if (singleValues.contains("angle")) { //detects when if find angle in a word
                var firstVal = singleValues
                var secondVal = ""
                var finalInt:Float
                var splitVal = firstVal.components(separatedBy: ":")
                for values in splitVal {
                    if values.contains("\n"){
                        //print(values.components(separatedBy: "\n"))
                        
                        secondVal = values.components(separatedBy: "\n")[0]

                        if let finalIntValue = Float(secondVal)  {
                            finalInt = finalIntValue
                            print(finalInt)
                            
                        } else {
                            
                        }
                        
                        //guard let newColor = system.colors["2"] else {
                         //   return
                        //}
                        
                    }
                }
                
            }
            if (singleValues.contains("axiom")) { //detects when if find angle in a word
                var firstVal = singleValues
                var secondVal = ""
                var finalInt:Float
                var splitVal = firstVal.components(separatedBy: ":")
                for values in splitVal {
                    if values.contains("\n"){
                        //print(values.components(separatedBy: "\n"))
                        
                        secondVal = values.components(separatedBy: "\n")[0]
                        print(secondVal)
                    }
                }
            }
            if (singleValues.contains("=")) { //detects when if find angle in a word
                var firstVal = singleValues
                var pred = ""
                var prob = 1
                var secc = ""
                var finalInt:Float
                var splitVal = firstVal.components(separatedBy: "=")
                pred = splitVal[0]
                secc = splitVal[1]
                if secc.contains("/") {
                    var splitNow = secc.components(separatedBy: "/")
                    if let probablity = Int(splitNow[0])  {
                        prob = probablity
                        //print(prob)
                        
                    } else {
                        
                    }
                    secc = splitNow[1]
                }
                print(pred)
                print(prob)
                print(secc)
                
            }
            if (singleValues.contains("generations")) { //detects when if find angle in a word
                var firstVal = singleValues
                var secondVal = ""
                var finalInt:Int
                var splitVal = firstVal.components(separatedBy: ":")
                for values in splitVal {
                    if values.contains("\n"){
                        //print(values.components(separatedBy: "\n"))
                        
                        secondVal = values.components(separatedBy: "\n")[0]
                        
                        if let finalIntValue = Int(secondVal)  {
                            finalInt = finalIntValue
                            print("Gen: \(finalInt)")
                            
                        } else {
                            
                        }
                        
                        //guard let newColor = system.colors["2"] else {
                        //   return
                        //}
                        
                    }
                }
                
            }


            
            
            
            
            
        }
    }
}
