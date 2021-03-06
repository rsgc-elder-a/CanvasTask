//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    
    
    let pathToFile = "/Users/student/Documents/Grade 12/Software/FileReadingWritingExample/FileReadingWritingExample/l-systems.txt"
    

    
    
    // Create the basic L-systems
    /*
     let kochSnowflake : LindenmayerSystem
     let kochIsland : LindenmayerSystem
     let kochSwirl : LindenmayerSystem
     let kochConstruction : LindenmayerSystem
     
     // Create the visualizations of the snowflake
     let smallKochSnowflake : VisualizedLindenmayerSystem
     let mediumKochSnowflake : VisualizedLindenmayerSystem
     
     // Create visualizations of other systems
     let largeKochIsland : VisualizedLindenmayerSystem
     */
    let kochSwirl : LindenmayerSystem
    let kochConstruction : LindenmayerSystem
    let mediumKochSwirl : VisualizedLindenmayerSystem
    let mediumConstruction : VisualizedLindenmayerSystem
    
    let kochBase : LindenmayerSystem
    let kochNew : VisualizedLindenmayerSystem
    let kochNew1 : VisualizedLindenmayerSystem
    let kochNew2 : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        
        // Open a file for reading and parse each line using the space character as a delimiter
        guard let reader = LineReader(path: pathToFile) else {
            print("Cannot open input file")
            exit(0); // cannot open file
        }
        
        // Create an empty array of type String
        var components : [String] = []
        
        // Process each line of the input file
        for (number, line) in reader.enumerated() {
            
            // DEBUG
            print("Parsing line \(number)")
            
            // Build an array of each component from the file
            components.append(contentsOf: line.components(separatedBy: " "))
            
        }
        
        // Now print the contents of the array created
        print("======== contents of components array are =======")
        for value in components {
           // print(value)
        }
        
        var fileContents = DataHolder(unParsedValue: components)
        
        //print(components)
        /*
         // Set up a Koch snowflake
         kochSnowflake = LindenmayerSystem(angle: 60,
         axiom: "1F++F++F",
         rules: ["F":"F-F++F-F"],
         generations: 5)
         //var colorFun : [String : Colour]
         //colorFun = []
         // Visualize this as a small snowflake
         smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
         length: 90,
         reduction: 3,
         x: 120,
         y: 175,
         direction: 0)
         
         
         // Visualize this as a small snowflake
         mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
         length: 270,
         reduction: 3,
         x: 250,
         y: 300,
         direction: 0,
         colors: [ "1" : Colour(hue: 100, saturaction: 80, brightness: 90) ]
         )
         
         
         // Set up a Koch Island
         kochIsland = LindenmayerSystem(angle: 90,
         axiom: "F-F-F-F",
         rules: ["F":"F-F+F+FF-F-F+F"],
         generations: 5)
         
         // Visualize the Koch Island
         largeKochIsland = VisualizedLindenmayerSystem(with: kochIsland,
         length: 300,
         reduction: 4,
         x: 100,
         y: 400,
         direction: 10)
         */
        //var ruleA = Rules(predeceser: "F", secseceser: ["F+F", "F-F", "FF"], probSec: [1, 1, 1])
        //let ruleA = Rules(predeceser: fileContents.allSystems[0]., secseceser: ["2F+F-F-F+F"], probSec: [1])
        // Set up a Koch Swirl
        kochSwirl = LindenmayerSystem(angle: Degrees(fileContents.allSystems[0].angleValue),
                                      axiom: fileContents.allSystems[0].axiom,
                                      rules: fileContents.allSystems[0].rules,
                                      generations: fileContents.allSystems[0].generation)
        
        // Visualize the Koch Swirl
        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
                                                      length: 100,
                                                      reduction: 3,
                                                      x: 20,
                                                      y: 170,
                                                      direction: 0,
                                                      colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ])
        
        let ruleA = Rules(predeceser: "Y", secseceser: ["3-FX-Y"], probSec: [1])
        let ruleB = Rules(predeceser: "X", secseceser: ["X+YF+"], probSec: [1])
        
        kochBase = LindenmayerSystem(angle: Degrees(90),
                                      axiom: "FX",
                                      rules: [ruleA, ruleB],
                                      generations: 8)
        
        // Visualize the Koch Swirl
        kochNew = VisualizedLindenmayerSystem(with: kochBase,
                                                      length: 2000,
                                                      reduction: 2,
                                                      x: 100,
                                                      y: 20,
                                                      direction: 270,
                                                      colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ])
        
        // Visualize the Koch Swirl
        kochNew1 = VisualizedLindenmayerSystem(with: kochBase,
                                              length: 2000,
                                              reduction: 2,
                                              x: 0,
                                              y: 0,
                                              direction: 270,
                                              colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ])
        
        // Visualize the Koch Swirl
        kochNew2 = VisualizedLindenmayerSystem(with: kochBase,
                                              length: 2000,
                                              reduction: 2,
                                              x: 0,
                                              y: -50,
                                              direction: 0,
                                              colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ])
        
        // Set up another Koch construction //F[−X][X]F[−X]+FX
        let rule1 = Rules(predeceser: "F", secseceser: ["F+[F-F]+F"], probSec: [1])
        let rule2 = Rules(predeceser: "Y", secseceser: ["F-[F+F]-F"], probSec: [1])
        
        kochConstruction = LindenmayerSystem(angle: 10,
                                             axiom: "1F+Y+F",
                                             rules: [rule1, rule2],
                                             generations: 4)
        
        // Visualize this other Koch construction
        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
                                                         length: 800,
                                                         reduction: 2,
                                                         x: 50,
                                                         y: 70,
                                                         direction: 0,
                                                         colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ] )
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        

        canvas.renderAnimated(system: [mediumConstruction], generation: 4)
        canvas.renderAnimated(system: [mediumKochSwirl], generation: 3)
        canvas.renderAnimated(system: [kochNew], generation: 8)
        canvas.renderAnimated(system: [kochNew1], generation: 8)
        canvas.renderAnimated(system: [kochNew2], generation: 8)
        

    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
