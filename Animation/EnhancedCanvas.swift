import Foundation

public class EnhancedCanvas : Canvas {
    
    public func render(system s : VisualizedLindenmayerSystem) {
        
        render(system: s, generation: s.n)
        
    }
    
    public func render(system : VisualizedLindenmayerSystem, generation : Int) {
        
        // self.saveState()
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Change the line length
        system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
        
        // Render the word
        self.saveState()
        self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        for c in system.word[generation].characters {
            interpret(character: c, forThis: system)
        }
        
        self.restoreState()
        //self.restoreState()
        
        
        //this delays code within it
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
        }
        
    }
    
    public func renderAnimated(system : VisualizedLindenmayerSystem, generation : Int) {
        //self.saveState()
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Things to do at start of L-system animation...
        if system.animationPosition == 0 {
            
            // Change the line length
            system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
            
            // Move turtle to starting point
            self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        }
        
        // Don't run past end of the word
        if system.animationPosition < system.word[generation].characters.count {
            
            // Get the index of the next character
            let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)
            
            // Get the next character
            let c = system.word[generation][index]
            
            // Render the character
            interpret(character: c, forThis: system)
            
            // Move to next character in word
            system.animationPosition += 1
            
        }
        
        //self.restoreState()
    }
    
    func interpret(character : Character, forThis system : VisualizedLindenmayerSystem) {
        //this delays code within it
        // Your code with delay
        // Interpret each character of the word
        switch character {
        case "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",  "Y", "Z" :
            // Go forward while drawing a line
            self.drawLine(fromX: 0, fromY: 0, toX: system.currentLength, toY: 0)
            self.translate(byX: system.currentLength, byY: 0)
        //print("foward")
        case "f":
            // Go forward without drawing a line
            self.translate(byX: system.currentLength, byY: 0)
            
        case "+":
            // Turn left
            self.rotate(by: system.angle)
        //print("turn")
        case "-":
            // Turn right
            self.rotate(by: system.angle * -1)
            //        case "[":
            //            // Turn right
            //            self.saveState()
            //        case "]":
            //            // Turn right
        //            self.restoreState()
        case "1":
            //
            guard let newColor = system.colors["1"] else {
                return
            }
            self.lineColor = Color(hue: newColor.hue, saturation: newColor.saturaction, brightness: newColor.brightness, alpha: 100)
            
        case "2":
            //
            guard let newColor = system.colors["2"] else {
                return
            }
            self.lineColor = Color(hue: newColor.hue, saturation: newColor.saturaction, brightness: newColor.brightness, alpha: 100)
            
        case "3":
            //
            guard let newColor = system.colors["3"] else {
                return
            }
            self.lineColor = Color(hue: newColor.hue, saturation: newColor.saturaction, brightness: newColor.brightness, alpha: 100)
            
            
        default:
            // Do nothing for any another character in the word
            break
        }
    }
}
