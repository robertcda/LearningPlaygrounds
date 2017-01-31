//: Playground - noun: a place where people can play

import UIKit


/*****/
protocol SomeStringProtocol{
    
}
extension String:SomeStringProtocol{
    
}

extension Array where Element:SomeStringProtocol {
    func getFirstStringValue() -> SomeStringProtocol?{
        return self.first
    }
}

let arrayOfStrings:[String] = ["str1","str2"]
arrayOfStrings.getFirstStringValue


/*
 ============
*/
class SomeClass{
    
}

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
