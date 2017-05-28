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
    
    public func renderAnimated(system : [VisualizedLindenmayerSystem], generation : Int) { //change to array to render multiple??
        
        for subSys in system{
            //self.saveState()
            
            // Verify that generation that was asked to be rendered actually exists
            var generation = generation
            if generation > subSys.n {
                generation = subSys.n
            }
            
            // Things to do at start of L-system animation...
            if subSys.animationPosition == 0 {
                
                // Change the line length
                subSys.currentLength = Float( Double(subSys.initialLength) / pow(Double(subSys.reduction), Double(generation)) )
                
                // Move turtle to starting point
                self.translate(byX: subSys.x, byY: subSys.y) // Move turtle to starting point
            }
            
            // Don't run past end of the word
            if subSys.animationPosition < subSys.word[generation].characters.count {
                
                // Get the index of the next character
                let index = subSys.word[generation].index(subSys.word[generation].startIndex, offsetBy: subSys.animationPosition)
                //this lines is real wierd
                //print("Index: \(index)")
                
                // Get the next character
                let c = subSys.word[generation][index]
                
                //print("Charicter is: \(c)")
                //self.saveState()
                // Render the character
                interpret(character: c, forThis: subSys)
                //self.restoreState()
                
                // Move to next character in word
                subSys.animationPosition += 1
                
            }
            //self.restoreState()
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
            //(pi/180)*deg
            let customeCon : Float = (Float.pi)/(Float(180))
            system.newX = cos(system.currentAngle*customeCon)*(system.currentLength)
            
            //print("Legnth of line X \(cos(system.currentAngle)*customeCon)") //in rad
            
            system.newY = sin((system.currentAngle*customeCon))*(system.currentLength)
            
            //print("Legnth of line Y \(sin(system.currentAngle))") //in rad
            
            system.newX = (system.newX)+(system.x)
            system.newY = (system.newY)+(system.y)
            //draw line according to formula
            //print(system.x, system.y, system.newX, system.newY, system.currentAngle)
            self.drawLine(fromX: system.x, fromY: system.y, toX: system.newX, toY: system.newY)
            //self.translate(byX: system.currentLength, byY: 0)
            system.x = system.newX
            system.y = system.newY
            
        case "f":
            // Go forward while drawing a line
            //(pi/180)*deg
            let customeCon : Float = (Float.pi)/(Float(180))
            system.newX = cos(system.currentAngle*customeCon)*(system.currentLength)
            
            //print("Legnth of line X \(cos(system.currentAngle)*customeCon)") //in rad
            
            system.newY = sin((system.currentAngle*customeCon))*(system.currentLength)
            
            //print("Legnth of line Y \(sin(system.currentAngle))") //in rad
            
            system.newX = (system.newX)+(system.x)
            system.newY = (system.newY)+(system.y)
            //draw line according to formula
            //print(system.x, system.y, system.newX, system.newY, system.currentAngle)
                        //self.translate(byX: system.currentLength, byY: 0)
            system.x = system.newX
            system.y = system.newY
            
        case "+":
            // Turn left
            system.currentAngle = (system.currentAngle)+Float(system.angle)
            
            
        case "-":
            // Turn right
            system.currentAngle = (system.currentAngle)-Float(system.angle)
            //self.rotate(by: system.angle * -1)
        case "[":
            //self.saveState() //for branching
            system.branchStartX.append(system.x) //should save where it started
            system.branchStartY.append(system.y)
            system.branchAngle.append(system.currentAngle)
            
        case "]":
            
            system.x = system.branchStartX.last! //then does back to it
            system.y = system.branchStartY.last! //then does back to it
            system.currentAngle = system.branchAngle.last! //then does back to it
            system.branchStartX.removeLast()
            system.branchStartY.removeLast()
            system.branchAngle.removeLast()
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
