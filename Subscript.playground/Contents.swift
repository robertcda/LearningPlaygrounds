//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class MyObject{}
class MyPersonalCollection{
    subscript (i: Int) -> MyObject?{
        return nil
    }
}


let myCollection = MyPersonalCollection()
let a = myCollection[1]
