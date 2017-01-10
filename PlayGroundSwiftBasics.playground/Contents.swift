//: Playground - noun: a place where people can play

import UIKit
var myString = "test"
let myConstantInt = 4
var myDouble: Double
var myBool: Bool

myString = "somthing else"
myDouble = 3.0
myBool = true

//Array
var array = ["twi", "tegbsdjo"]
var array2: [String] = []
var myArray = [String]()
let myStringArray = Array<String>()

//WTF ?!
var arrayHeterogenous: [Any] = [3,"toto"]

myArray.append("one")
let myElemFromArray = array[0]


//Hash ou les dict
var myDict: [String: Any] = ["keyOne": 45, "keyTwo": "toto"]
let myElemFromDict = myDict["keyOne"]
myDict["keyThree"] = false
myDict.removeValue(forKey: "keyTwo")
myDict


//Tuple
var myTuple = (23, "jordan", "toto")
myTuple.0
myTuple.1

var myTupleNamed = (num: 23, name : "jordan")
myTupleNamed.num
myTupleNamed.name

let (num, _) = (23, "jordan")
num



//Enum, Struct et Class ont la capacité d'être conforme à des protocols
//Seules les classes peuvent hériter

//Enum 
enum SituationBancaire {
    case positif(Int)
    case negatif(Int)
    
    func comment() -> String {
        switch self {
        case .positif(_):
            return  "cool"
        case .negatif(let value):
            return "pas cool \(value) de sous en moins"
        }
    }
}

let mySituation = SituationBancaire.negatif(3000)
//print(mySituation.comment())


struct Person {
    var name: String
    var yearOfBirth: Int
    var situationEnBanque: SituationBancaire
    

    
    var age: Int {
        get {
            return 2017 - yearOfBirth
        }
        set {
            yearOfBirth = 2017 - newValue
        }
    }
    
    func displayHappyMessage() {
        print(situationEnBanque.comment())
    }
}

var me = Person(name: "Iman", yearOfBirth: 1979, situationEnBanque: .negatif(1000))

me.displayHappyMessage()
me.age
me.yearOfBirth


struct Constants {
    struct Colors {
        static let modifiedRed = UIColor.red
        static let modifiedBlue = UIColor.blue
    }
}


let myView = UIView()
myView.backgroundColor = Constants.Colors.modifiedBlue



class Tower: Building {

    var life: Double
    
    init(nbOfWindows: Int, nbOfDoors: Int, life: Double) {
        self.life = life
        super.init(nbOfWindows: nbOfWindows, nbOfDoors: nbOfDoors)
    }
    
    init(tower: Tower) {
        self.life = tower.life
        super.init(nbOfWindows: tower.nbOfWindows, nbOfDoors: tower.nbOfDoors)
    }
    
    override func upgrade() {
        
    }
    
    func attack() {
        
    }
}

class Building {
    var nbOfWindows: Int
    var nbOfDoors: Int
    
    init (nbOfWindows: Int, nbOfDoors: Int) {
        self.nbOfWindows = nbOfWindows
        self.nbOfDoors = nbOfDoors
    }
    
    func upgrade() {
        
    }
}


let oneTower = Tower(nbOfWindows: 3, nbOfDoors: 1, life: 100)
let secondTower = Tower(tower: oneTower)


///////////////////////////////
var tom = Person(name: "Tom", yearOfBirth: 1476, situationEnBanque: .negatif(1000))

print(tom.name)

var bob = tom
print(bob.name)
bob.name = "Bob"
print(bob.name)
print(tom.name)

var wtc = Building(nbOfWindows: 1000, nbOfDoors: 70)

var esb = wtc
print(esb.nbOfWindows)
esb.nbOfWindows = 500
print(esb.nbOfWindows)
print(wtc.nbOfWindows)


//Optional
var monEntierOptionnel: Int?
monEntierOptionnel = Int("3")

//forced unwrapping
let result = monEntierOptionnel!

//explicit unwrapping (faire un test)
if monEntierOptionnel != nil {
    print(monEntierOptionnel!)
    
} else {
    print("pas de valeur")
}
//optional binding
if let myResult = monEntierOptionnel {
    print(myResult)
}

//nil coallescing operator
let result2 = monEntierOptionnel ?? 23


//optional chaining 
struct Someone {
    var name = ""
    var residence: Residence?
}

struct Residence {
    let nbWidows = 3
    let nbDoors = 1
}

//optional chaining
var you = Someone()
let residence = Residence()
you.residence = residence

let nbDoors = you.residence?.nbDoors


func add(firstInt a: Int, secondInt b: Int) -> Int {
    return a + b
}

add(firstInt: 2, secondInt: 3)

let maFunction = add
maFunction(5, 6)


let myProductClosure = { (a: Int, b: Int) -> Int in
   return a * b
}


func doArithmeticOperation(a: Int, b: Int, f: (Int, Int) -> Int) -> Int {
    return f(a,b)
}

doArithmeticOperation(a: 4, b: 3) { (a: Int, b: Int) -> Int in
    return a - b
}


let arrayOfString = ["toto","1","4","9"]
//trasnformer ce tableau en  tableau de Int

var newTab = [Int]()

for s in arrayOfString {
    if let i = Int(s) {
        newTab.append(i)
    }
}

print(newTab)

let resultOfChaining = arrayOfString
    .map { Int($0) ?? 0 }
    .filter { $0 > 0 }
    .reduce(0) { $0 + $1 }

print(resultOfChaining)





