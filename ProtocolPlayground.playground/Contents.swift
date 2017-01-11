

enum CoffeeType: String {
    case latte
    case americano
    case frapuccino
}

protocol CoffeeMakerDelegate {
    func makeCoffee(type: CoffeeType)
}

protocol CoffeeMakerDatasource {
    func giveMeTheMenu() -> [CoffeeType]
}


extension CoffeeMakerDatasource {
    func giveMeTheMenu() -> [CoffeeType] {
        return [.frapuccino]
    }
}


struct Starbucks {
    var name: String
}

extension Starbucks: CoffeeMakerDelegate {
    
    func makeCoffee(type: CoffeeType) {
        print("votre café est pret et il est de type " + type.rawValue)
    }
}

extension Starbucks: CoffeeMakerDatasource {
    func giveMeTheMenu() -> [CoffeeType] {
        return [.americano, .latte, .frapuccino]
    }
}

struct Costa: CoffeeMakerDelegate, CoffeeMakerDatasource {

    func makeCoffee(type: CoffeeType) {
        print("votre café est pret mais il est meilleur chez nous. Il est de type " + type.rawValue)
    }
}


struct Person {
    var name = ""
    var coffeeHouse: CoffeeMakerDelegate?
    var coffeeHouseDataSource: CoffeeMakerDatasource?

    func onWakeUp() {
        //fais son café
        if let coffees = coffeeHouseDataSource?.giveMeTheMenu() {
            coffeeHouse?.makeCoffee(type: coffees[0])
        }
    }
}


let me = Person(name: "Iman", coffeeHouse: Starbucks(name: "Starbucks avenue du bel air"), coffeeHouseDataSource:Costa())
me.onWakeUp()
