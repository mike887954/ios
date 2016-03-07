//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str2: String
str2 = "Inistring"

let str3 = "Ini saja"
print(str3)

let coordinates: (Double, Int) = (2.49, 3)
let x: Int = Int(coordinates.0 + 0.5)
let y: Int = coordinates.1

let benarkah = true || false
let salahkah = true && false

let name = "Matt"
let message = "Hello my name is "+name+"!"
let nessage = "Hello my name is \(name)!"

let stringA = "café"
let stringB = "cafe\u{0301}"
let equal = stringA == stringB
stringA.characters.count
stringB.characters.count

let string = "Swift Apprentice is a great book!"
string.uppercaseString
string.lowercaseString

let number = 10
switch (number) {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}

var games = [String]()
var games2 = [[String]]()
games = ["CoC", "GoT"]
games2 = [ ["g1", "g2"], ["g3", "g4"]]
games[0]
games2[1][1]

var expenses = [ "bills" : ["internet", "electricity", "heat"] ]
for (type, reasons) in expenses {
    for items in reasons {
        print(items)
    }
}

func addNums(SumbuX x: Int, SumbuY y: Int) -> Int {
    return x + y;
}

// Call a method
addNums(SumbuX: 1, SumbuY: 2)
addNums(SumbuX: 3, SumbuY: 4)


func calcTip(total: Double, tipPct: Double = 0.15) -> Double
{
    return total * tipPct
}

let tip1 = calcTip(10)
let tip2 = calcTip(20, tipPct: 0.2)

enum Hari {
    case Senin
    case Selasa
    case Rabu
    case Kamis
    case Jumat
    case Sabtu
    case Minggu
}

var hariIni = Hari.Jumat
if (hariIni == .Senin) {
    print("betul ini hari Senin", terminator: "")
} else {
    print("bukan hari Senin", terminator: "")
}

enum Kecepatan: Int {
    case Lambat = 20
    case Sedang = 40
    case Cepat = 60
    init() {
        self = .Cepat
    }
}

var mobilKu = Kecepatan()
mobilKu
mobilKu.rawValue
mobilKu = .Lambat
mobilKu

class Contact {
    var firstName: String
    var lastName: String
    var type: String = "Friend"
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var person = Contact(firstName: "Jon", lastName: "Smith")
person

var person2 = person
person2.firstName = "Adi"
person2.lastName = "M"
person
person2

var myInt: Int? = 10
var myOptionalString: String?

myInt = nil

if myInt != nil {
    print(myInt!)
} else {
    print("myInt is nil!")
}

func searchFlightNumber(username: String) -> String? {
    let flights = [
        "VN123" : ["Sam", "David"],
        "fr123" : ["John", "Steve"]
    ]
    
    for (flightNumber, customers) in flights {
        // swift 1.2: if indexOf(customers, username) { }
        if customers.contains(username) {
            return flightNumber
        }
    }
    // tells the user that username doesn't exist
    return nil
}

let myFlight = searchFlightNumber("Justin")
//print(myFlight!)
print(myFlight)

if myFlight != nil {
    print(myFlight!)
} else {
    // this myFlight is nil
    print("there's no flight")
}

if let unwrappedMyFlight = searchFlightNumber("DTran") {
    // if unwrappedMyFlight is not nil, then it goes to this block
    print(unwrappedMyFlight)
    
} else {
    // if searchFlightNumber returns nil, it jumps to this block
    print("doesn't exist")
}
