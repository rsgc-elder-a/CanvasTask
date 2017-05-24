//
//  VisualizedLindenmayerSystem.swift
//  Canvas
//
//  Created by Russell Gordon on 5/3/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class VisualizedLindenmayerSystem : LindenmayerSystem {
    
    var branchStartX : Float //need to make a stack for branching
    var branchStartY : Float
    var branchAngle : Float
    
    var newX : Float
    var newY : Float
    var currentAngle: Float
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Float                             // initial horizontal position of turtle
    var y : Float                             // initial vertical position of turtle
    var direction : Int                     // initial direction turtle faces (degrees)
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var colors : [String: Colour] 

    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Float,
                y: Float,
                direction: Int,
                colors : [String: Colour] = [:]) {
        
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.colors = colors
          
        self.newX = x
        self.newY = y
        self.branchStartX = x
        self.branchStartY = y
        self.branchAngle = 0.0
        self.currentAngle = Float(direction)
        super.init(with: providedSystem)
        
    }
    

}

