//: Playground - noun: a place where people can play

import UIKit

// The power of flatmap

var arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]

// If i want to multiply each value with some constant, we can achieve this by calling map twice.
let contant = 3
let mappedArray = arrayOfArrays.map({ array in
    return array.map({ val in
        return val * contant
    })
})

print(mappedArray)

// If i want it to multiple it by a constant & make it to a single array.

let mappedArray2 = arrayOfArrays.map({ array in
    return array.map({ val in
        return val * contant
    })
})
let flatennedMappedArray = Array(mappedArray2.joined())

// Fortunately, we can use flatmap for the same thing.

let mappedArray3 = arrayOfArrays.flatMap({ array in
    return array.map({ val in
        return val * contant
    })
})

// Example 2
// Another classic example to use flatMap is when having an array of optionals
// Flat map removes optionals when mapping.
let numbers: [Int?] = [1, nil, 3]
let numbersMap = numbers.map { return $0 }
print(numbersMap) // [Optional(1), nil, Optional(3)]
let numbersFlatMap = numbers.flatMap { return $0 }
print(numbersFlatMap) // [1, 3]


// Practical Example 3
// Another good way to use flat map is during initialization

// A function that simulates the return of employees from the server
func getEmployeesFromServer() -> [Dictionary<String,Any>]{
    return [
        ["id":1,"name":"Bob"], // This employee has an id
        ["id":2,"name":"Clarence"], // This employee has an id
        ["name":"Almeida"] // This employee has an id, possibly someone who has just joined the organization.
    ]
}

// A class that represents the Employee
class Employee{
    
    let id: Int
    let name: String
    
    // We can initialize the Employee from the Dictionary returned by the server
    // Note that this returns an optional
    init?(dictionary:[String:Any]) {
        guard
            let idVal = dictionary["id"] as? Int,
            let nameVal = dictionary["name"] as? String
            else {
            return nil
        }
        self.id = idVal
        self.name = nameVal
    }
}

// If i have to create an array of employee Objects.

// Method 1
var arrayOfEmployeesMethod1:[Employee] = []
for eachEmployeeDict in getEmployeesFromServer(){
    if let employee = Employee.init(dictionary: eachEmployeeDict){
        arrayOfEmployeesMethod1.append(employee)
    }
}
print(arrayOfEmployeesMethod1)

// Method 2
// We can use map to try to get each employee
var arrayOfEmployeesMethod2:[Employee?] = getEmployeesFromServer().map({Employee.init(dictionary: $0) })
print(arrayOfEmployeesMethod2)
// The problem here is that the array will contain a nil value, so the Employee has to be optional.

// Method 3
var arrayOfEmployeesMethod3: [Employee] = getEmployeesFromServer().flatMap({Employee.init(dictionary: $0)})
print(arrayOfEmployeesMethod3)
// So using flatMap we can filter all the optional values in one shot.




// Sorting Numbers
var numbersToSort = [3,2,1,4,5]

numbersToSort.sorted()
numbersToSort.sort(by: {num1, num2 in return num1 < num2 })

let mappedNumbers = numbersToSort.map({$0*2})
print(numbersToSort)
