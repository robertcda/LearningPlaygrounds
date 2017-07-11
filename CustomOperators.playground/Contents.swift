//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Emotion{
    case 😊, 😔, 😶
}

// ==== Lets define Humans

class Human{
    
    var context: Any? = nil
    
    var name:String = ""{
        didSet{
            print("\(self): is named \"\(name)\".")
        }
    }
    var age = 0{
        didSet{
            print("\(self): is now \(age) years old.")
        }
    }
    var feeling:Emotion = .😶{
        didSet{
            print("\(self): is now \(feeling).")
        }
    }
    
    convenience init(_ name:String, context: Any? = nil) {
        self.init()
        self.name = name
        print("CREATED " + "\(self)")
    }
}
extension Human: CustomStringConvertible {
    var description: String {
        return "Human:name:\(self.name)"
    }
}

// ==== Lets define Family

class Family{
    var members:[Human] = []
    init(firstPerson:Human,secondPerson:Human) {
        members.append(contentsOf: [firstPerson,secondPerson])
        print("Family started: \(self.members)")
    }
    
    func makeLove(){
        
        // Some complex logic unknown to mortals
        let luck = arc4random_uniform(100)
        switch luck {
        case 100:
            self.members.append(contentsOf: self.createChildren(number: 3)) // Triplets
            print("Congratulations! you have triplets!")
            
        case 80...90:
            self.members.append(contentsOf: self.createChildren(number: 3)) // Twins
            print("Congratulations! you have twins!")
            
        case 50...60:
            self.members.append(contentsOf: self.createChildren(number: 3)) // Single child
            print("Congratulations! you have a child")
            
        default: break // I'm sorry
        }
        
    }
    
    private func createChildren(number:Int) -> [Human]{
        var children:[Human] = []
        for child in 0..<number{
            children.append(Human())
        }
        return children
    }
}

extension Family: CustomStringConvertible {
    var description: String {
        return "Family: \(self.members)"
    }
}


prefix operator +++
postfix operator ☺︎
postfix operator ☹
infix operator ♡: AdditionPrecedence

extension Human{
    static prefix func +++(someGuy: inout Human){
        someGuy.age += 1
    }
    
    static postfix func ☺︎(someGuy: inout Human) {
        someGuy.feeling = .😊
    }
    static postfix func ☹(someGuy: inout Human) {
        someGuy.feeling = .😔
    }
    
    static func ♡(someGuy: inout  Human, otherGuy: inout Human) -> Family {
        let family = Family(firstPerson: someGuy, secondPerson: otherGuy)
        
        // After marriage both are happy...
        someGuy☺︎
        otherGuy☺︎
        
        return family
    }
    
}

// MAIN()

print("lets create a human being..")
var adam = Human("Adam")

print("He should age in the course of time..")
+++adam

switch adam.feeling{
case .😊: break // all seems good
case .😔,.😶:
    print("Something is wrong with adam. I think its time to create a companion for adam, so lets create eve keeping adam in mind")
    var eve = Human("Eve",context:adam)
    
    // Bone of my bone and flesh of my flesh, Lets make the Both of them start a family
    let 👫 = adam ♡ eve
    👫.makeLove()
}



