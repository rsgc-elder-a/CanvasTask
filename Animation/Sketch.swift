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
            print(value)
        }
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
        let ruleA = Rules(predeceser: "F", secseceser: ["2F+F-F-F+F"], probSec: [1])
        // Set up a Koch Swirl
        kochSwirl = LindenmayerSystem(angle: 90,
                                      axiom: "F",
                                      rules: [ruleA],
                                      generations: 2)
        
        // Visualize the Koch Swirl
        mediumKochSwirl = VisualizedLindenmayerSystem(with: kochSwirl,
                                                      length: 100,
                                                      reduction: 3,
                                                      x: 50,
                                                      y: 50,
                                                      direction: 0,
                                                      colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ])
        
        
        
        // Set up another Koch construction //F[−X][X]F[−X]+FX
        let rule1 = Rules(predeceser: "F", secseceser: ["F+[F-F]+F"], probSec: [1])
        let rule2 = Rules(predeceser: "Y", secseceser: ["F-[F+F]-F"], probSec: [1])
        
        kochConstruction = LindenmayerSystem(angle: 10,
                                             axiom: "1F+Y+F",
                                             rules: [rule1, rule2],
                                             generations: 6)
        
        // Visualize this other Koch construction
        mediumConstruction = VisualizedLindenmayerSystem(with: kochConstruction,
                                                         length: 800,
                                                         reduction: 2,
                                                         x: 50,
                                                         y: 100,
                                                         direction: 0,
                                                         colors: [ "1" : Colour(hue: 200, saturaction: 80, brightness: 90), "2" : Colour(hue: 0, saturaction: 80, brightness: 90), "3" : Colour(hue: 300, saturaction: 80, brightness: 90) ] )
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 120
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        // Render the current system
        
        //canvas.saveState()
        
        //canvas.renderAnimated(system: mediumKochSwirl, generation: 4)
        canvas.renderAnimated(system: [mediumConstruction], generation: 6)
        canvas.renderAnimated(system: [mediumKochSwirl], generation: 2)
        
        //canvas.restoreState()
        
        //canvas.render(system: mediumConstruction, generation: 3)
        //canvas.renderAnimated(system: mediumConstruction, generation: 3)
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
