import Foundation

public class LindenmayerSystem {
    // Set up required information
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rules : [Rules]    //make a random choice
    var n : Int                         // number of times the production rule is applied
    var word : [String] = []            // the word that will be rendered
    // is rendered with an animation, step by step
    
    
    public init(angle : Degrees,
                axiom : String,
                
                rules : [Rules], //change to
        generations : Int) {
        
        // Initialize stored properties
        self.angle = angle
        self.axiom = axiom
        self.rules = rules
        self.n = generations
        self.word.append(axiom)   // The first word is the axiom
        
        // Apply the production rule
        applyRules()
        
    }
    
    public init(with system : LindenmayerSystem) {
        
        // Initalize stored properties
        self.angle = system.angle
        self.axiom = system.axiom
        self.rules = system.rules
        self.n = system.n
        self.word.append(axiom)   // The first word is the axiom
        
        // Apply the production rule
        applyRules()
    }
    
    func applyRules() {
        
        // See if word needs to be re-written
        if n > 0 {
            
            // Apply the production rule "n" times
            for i in 1...n {
                
                // Create a new word
                var newWord = ""
                
                // Inspect each character of existing word
                for character in word[i - 1].characters { //charicter are what we are inspecting
                    
                    for val in rules { //loops through rules
                        //might want to focus on one rule
                        for index in 0...val.probSec.count { //looks at one object and loops through rules manually
                            
                            if character == val.predeceser { //looks at preddiseso to replace
                                
                                newWord.append(val.chooseSecseceser()) //choose secsessor might not work
                                break
                            }
                            
                        }
                        
                        
                    }
                    // [ means you need to do a save state
                    // ] means you need to do a restores stae to get back where you where
                    if character == "-" || character == "+"
                    { //just add in word again if not working
                        newWord.append(character)
                        //print("Charicter appended \(character)")
                        
                    }
                }
                
                // Add the re-written word to the system
                word.append(newWord)
                print(word)
                
            }
            
        }
        
    }
    
}
