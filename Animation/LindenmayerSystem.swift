import Foundation

public class LindenmayerSystem {
    // Set up required information
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rules : [Character : String]    //make a random choice
    
    var n : Int                         // number of times the production rule is applied
    var word : [String] = []            // the word that will be rendered
    // is rendered with an animation, step by step
    
    
    public init(angle : Degrees,
                axiom : String,
                
                rules : [Character : String], //change to 
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
                for character in word[i - 1].characters {
                    
                    
                    for (key, rule) in rules { //should loop through dictionary and append rules
                        
                        if character == key {
                            
                            // apply production rule, replace "old" F with new string
                            newWord.append(rule)
                            //print("replace letter")
                        }
                        //F+F−F−F+F + F+F−F−F+F − F+F−F−F+F − F+F−F−F+F + F+F−F−F+F
                        // just copy what's in the existing word to the new word
                        //                        if character == "-" || character == "+" //not picking up on minus
                        //                        {
                        //                            newWord.append(character)
                        //                            print("Charicter appended \(character)")
                        //
                        //                        }
                    }
                    if character == "-" || character == "+" //not picking up on minus
                    {
                        newWord.append(character)
                        print("Charicter appended \(character)")
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                // Add the re-written word to the system
                word.append(newWord)
                print(word)
                
            }
            
        }
        
    }
    
}
