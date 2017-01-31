//: Playground - noun: a place where people can play

import UIKit



var str = "Hello, playground"

/* 
 Protocol extensions:
 This is something I really am amazed. The ability to add functionality to protocols using protocol extensions.
 */

// A text book example of this would be.

// Lets define a protocol that shows that something has life
protocol Life{}

// A human being can have life.
class HumanBeing:Life{}

// A plant can have life too
class Plant: Life{}

// At a later point in time in the evolution of my app, i come up with a philosophical thought.
// "Everything that has life has a soul." - I would like to talk to the soul of everything that has life.
extension Life{
    func dearSoul(message:String){
        print("\(self): Soul: \(message)")
    }
}

let human = HumanBeing()
let mangoPlant = Plant()
human.dearSoul(message:"How are you?")
mangoPlant.dearSoul(message:"I never knew you had life")

/*
 Isn't this cool, Plant & HumanBeing are just empty classes, by just complying to a protocol, it has the ability to add some functionality to it.
 */
/* ============== */


