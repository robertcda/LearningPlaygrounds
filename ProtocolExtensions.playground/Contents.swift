//: Playground - noun: a place where people can play

import UIKit



var str = "Hello, playground"

/* PRotocol extensions */
protocol masterProtocol{
    
}
protocol FirstProtocol:masterProtocol{
    var someAttr1:String?{
        get
    }
}

extension FirstProtocol{
    func secondaryFunc(){
        print("secondaryFunc: self.someAttr1:\(self.someAttr1)")
    }
}


class ProtoExtensionClass{
    var someAttr1:String? = "string"
}
extension ProtoExtensionClass:FirstProtocol{}

class SecondClass:FirstProtocol{
    var someAttr1:String? = "string"
}

let protoObj = ProtoExtensionClass()
protoObj.secondaryFunc()

let secondObj = SecondClass()
secondObj.secondaryFunc()


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
