//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


protocol classHasSingleton{
    static var instance:classHasSingleton {get}
    class func initializeInstance() -> classHasSingleton
}

class A:classHasSingleton{
    static let instance = A()
}