//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let fileName = ""
if let fileURL = Bundle.main.url(forResource: "MainVCString", withExtension: "json"){
    if let data = try? Data(contentsOf: fileURL, options: Data.ReadingOptions.uncached){
        print("This works!")
    }else{
        print("Something wrong with the path.")
    }
}




/* Singeton class. */

class SingletonClass{
    private static let _instance = SingletonClass()
    class var instance: SingletonClass {
        get{
            return _instance
        }
    }

    private init() {
    }
    
    init(another:Int){
        
    }
}

let instance = SingletonClass.instance
let instance1 = SingletonClass(another: 1)



NotificationCenter.default

/*

func factorial(number: Int) -> (Int) {
    if (number <= 1) {
        return 1
    }
    
    return number * factorial(number: number - 1)
}

var test_cases:Int = Int(readLine()!)!
var answer_array = [Int]()

for item in 1...test_cases {
    let num = Int(readLine()!)!
    let answer = factorial(number: num)
    answer_array.append(answer)
}

for item in answer_array {
    print(item)
}
*/
