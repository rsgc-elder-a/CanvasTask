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
        var generation : Int
        var angleValue : Float
        var axiom : String
        var rules : [Rules]
        
        init(generation: Int, angleVal: Float, axiom: String, rules: [Rules]) {
            self.generation = generation
            self.angleValue = angleVal
            self.axiom = axiom
            self.rules = rules
        }
        
    }
    
    //var allSystems : [KeyValues]
    
    public init (unParsedValue : [String]){
        self.unParsedValue = unParsedValue
        //self.allSystems
        print(parseDes(values: unParsedValue))
        //Parce makes a array of key values
        
        
    }
    
    func parseDes(values : [String]) -> [KeyValues] {
        
        var allSystems : [KeyValues] = []
        var index = 0
        var currentSystem = KeyValues(generation : 0, angleVal: 0.0, axiom: "", rules: [])
        for singleValues in values {
            
            
            
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
                            //print(finalInt)
                            
                            currentSystem.angleValue = finalInt
                            
                        } else {
                            
                        }
                        
                        
                        
                        
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
                        
                        
                        currentSystem.axiom = secondVal //should set value to axiom
                        //print(secondVal)
                        
                        
                        
                        
                    }
                }
            }
            if (singleValues.contains("=")) { //detects when if find angle in a word
                if (singleValues.contains("A") || singleValues.contains("B") || singleValues.contains("C") || singleValues.contains("D") || singleValues.contains("E") || singleValues.contains("F") || singleValues.contains("G") || singleValues.contains("H") || singleValues.contains("I") || singleValues.contains("J") || singleValues.contains("K") || singleValues.contains("L") || singleValues.contains("M") || singleValues.contains("N") || singleValues.contains("O") || singleValues.contains("P") || singleValues.contains("Q") || singleValues.contains("R") || singleValues.contains("S") || singleValues.contains("T") || singleValues.contains("U") || singleValues.contains("V") ||  singleValues.contains("W") || singleValues.contains("X") ||  singleValues.contains("Y") || singleValues.contains("Z")){ //check to make sure its not colour
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
                    var momentSecc = secc.components(separatedBy: "\n")
                    secc = momentSecc[0]
                    var firstCheck = false
                    for checkPre in currentSystem.rules { //this part very likely needs testing
                        if checkPre.predeceser == Character(pred) { //if there already is same rule add proper values
                            checkPre.secseceser.append(secc)
                            checkPre.probSec.append(prob)
                            firstCheck = true
                            break
                            
                        }
                        
                        //firstCheck = true
                    }
                    if firstCheck == false {
                        currentSystem.rules.append(Rules(predeceser: Character(pred), secseceser: [secc], probSec: [prob]))
                    }
                    //print(pred)
                    //print(prob)
                    //print(secc) //have extra \n
                    
                }
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
                            //print("Gen: \(finalInt)")
                            
                            currentSystem.generation = finalInt
                            
                        } else {
                            
                        }
                        
                        
                        
                    }
                }
                index += 1
                //print("Index: \(index)")
                /*
                
                 print(currentSystem)
                for i in currentSystem.rules{
                    print(i.predeceser)
                    print(i.secseceser)
                    print(i.probSec)
                }
                 print("")
 
                */
                
                allSystems.append(currentSystem)
                
                
                currentSystem.rules.removeAll()//resets for next round
                
                
            }
        }
        return allSystems
    }
}
