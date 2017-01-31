//: Playground - noun: a place where people can play

import UIKit


/**  Extending Arrays: if I want to add functionality to an Array which holds elements of type protocol. ***/
protocol SomeStringProtocol{}

/* Here we can even make String Struct comply to this, for it to work with Array of Strings. */
extension String:SomeStringProtocol{}

extension Array where Element:SomeStringProtocol {
    func getFirstStringValue() -> SomeStringProtocol?{
        return self.first
    }
}
let arrayOfStrings:[String] = ["str1","str2"]
arrayOfStrings.getFirstStringValue


/** Extending Arrays, which contain a particular Class type.*/
class SomeClass{}

extension Array where Element:SomeClass {
    mutating func removeSomething(){
        self.remove(at: 0)
    }
    mutating func addSomeClass(some:SomeClass){
        self.append((some as? Element)!)
    }
}

var arr = [SomeClass(),SomeClass(),SomeClass()]
arr.removeSomething()
arr.addSomeClass(some: SomeClass())
