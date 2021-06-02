import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


// Задача - купить автомобиль в автосалоне



enum Equipment : String {
    case standart = "Стандартная комплектация"
    case normal = "Средняя комплектация"
    case high = "Максимальная комплектация"
    
}


enum BayCarErrors : Error {
    
    case notAvailability  // нет в наличии
    case wrongСolor //  не тот цвет
    case wrongEquipment // нет комплектации
    case notEnoughMoney (needToMoney :Int) // недостаточно финансов, сколько не хватает{
    case doesNotExist  // не существует
    
    var localizedDescription : String {
        switch self {
        case .notAvailability:
            return "Такого автомобиля нет в наличии."
        case .wrongСolor :
            return "Автомобиля с таким цветом нет в наличии."
        case .notEnoughMoney(needToMoney: let needToMoney):
            return """
                   Вы не можете приобрести данный автомобиль.
                   У вас не хватает \(needToMoney) рублей."
                   """
        case .wrongEquipment :
            return "Автомобиля с такой комплектацией нет."
        case .doesNotExist :
            return "Такого автомобиля Toyota не существует."
            
        }
    }
}
    

struct CarsOnParking {
    
    let carName  : String
    let carColor : String
    let carPrice : Int
    var carCount : Int
    var equipment: Equipment
    
    
}

//struct Produkt {
//
//    var name : String
//
//}

class BayCar {
    
    
// Что числится у диллера на стоянке
   
    var parkingCars = [
        "Corolla" : CarsOnParking(carName: "Corolla", carColor: "White", carPrice: 1_200_000, carCount: 2, equipment: .normal),
        "Camry": CarsOnParking(carName: "Camry",carColor: "Black", carPrice: 1_600_000, carCount: 3, equipment: .standart ),
        "RAV4" : CarsOnParking(carName: "RAV4", carColor: "Red", carPrice: 1_900_000, carCount: 1, equipment: .normal),
        "Highlander" : CarsOnParking(carName: "Highlander", carColor: "Blue", carPrice: 2_500_000, carCount: 2, equipment: .high),
        "Land Cruzer": CarsOnParking(carName: "Land Cruzer", carColor: "Black", carPrice: 3_800_000, carCount: 1, equipment: .standart)
    ]
  
  var myMoney = 2_000_000  // сколько у меня денег
  
    
    func bayCars (carName : String, color : String, equip : Equipment) throws { // метод генерирующий ошибки и покупающий автомобиль
        
        print(
              """

              *************************************************
              Вы хотите приобрести автомобиль Toyota \(carName)
              Цвет - \(color)
              Комплектация - \(equip.rawValue)
              *************************************************

              """
        )
        
        guard let item = parkingCars[carName] else {throw BayCarErrors.doesNotExist}
        
        guard item.carCount > 0 else { throw BayCarErrors.notAvailability}
        
        guard item.carPrice < myMoney else { throw BayCarErrors.notEnoughMoney(needToMoney: item.carPrice - myMoney)}
        
        guard item.carColor == color else { throw BayCarErrors.wrongСolor}
        
        guard item.equipment == equip else { throw BayCarErrors.wrongEquipment}
                
        
        myMoney -= item.carPrice
        
        var carCountAfterBay = item
        
        carCountAfterBay.carCount -= 1
        
        parkingCars[carName] = carCountAfterBay
        
        
        print(
            """
            ============================================================
            Вы приобрели автомашину \(carName)
            Стоимость составила \(carCountAfterBay.carPrice) рублей
            Остаток денежных средств \(myMoney)
            Цвет - \(color)
            Комплектация - \(equip)
            Осталось на стоянке таких машин - \(carCountAfterBay.carCount)
            ==============================================================
            """
        )
    }
    
}


let myCar = BayCar()


do{
    _ = try myCar.bayCars(carName: "Camry", color: "Yellow", equip: .standart)
    print("Поздравляем Вас с покупкой автомобиля!!!")
}
catch BayCarErrors.wrongEquipment{
    print(BayCarErrors.wrongEquipment.localizedDescription)
}
catch BayCarErrors.wrongСolor {
    print(BayCarErrors.wrongСolor.localizedDescription)
}

catch BayCarErrors.doesNotExist {
    print(BayCarErrors.doesNotExist.localizedDescription)
}
catch BayCarErrors.notEnoughMoney(let needToMoney){
    print(BayCarErrors.notEnoughMoney(needToMoney: needToMoney).localizedDescription)
}
catch BayCarErrors.notAvailability {
    print(BayCarErrors.notAvailability.localizedDescription)
}


        
    
do{
    _ = try myCar.bayCars(carName: "Camry", color: "Black", equip: .high)
    print("Поздравляем Вас с покупкой автомобиля!!!")
}
catch BayCarErrors.wrongEquipment{
    print(BayCarErrors.wrongEquipment.localizedDescription)
}
catch BayCarErrors.wrongСolor {
    print(BayCarErrors.wrongСolor.localizedDescription)
}
catch BayCarErrors.doesNotExist {
    print(BayCarErrors.doesNotExist.localizedDescription)
}
catch BayCarErrors.notEnoughMoney(let needToMoney){
    print(BayCarErrors.notEnoughMoney(needToMoney: needToMoney).localizedDescription)
}
catch BayCarErrors.notAvailability {
    print(BayCarErrors.notAvailability.localizedDescription)
}



myCar.myMoney = 1_000_000 // если у меня только 1 млн денег

do{
    _ = try myCar.bayCars(carName: "Camry", color: "Black", equip: .standart)
    print("Поздравляем Вас с покупкой автомобиля!!!")
}
catch BayCarErrors.wrongEquipment{
    print(BayCarErrors.wrongEquipment.localizedDescription)
}
catch BayCarErrors.wrongСolor {
    print(BayCarErrors.wrongСolor.localizedDescription)
}
catch BayCarErrors.doesNotExist {
    print(BayCarErrors.doesNotExist.localizedDescription)
}
catch BayCarErrors.notEnoughMoney(let needToMoney){
    print(BayCarErrors.notEnoughMoney(needToMoney: needToMoney).localizedDescription)
}
catch BayCarErrors.notAvailability {
    print(BayCarErrors.notAvailability.localizedDescription)
}



myCar.myMoney = 2_000_000 // если у меня хватает денег


do{
     _ = try myCar.bayCars(carName: "Camry", color: "Black", equip: .standart)
    print("Поздравляем Вас с покупкой автомобиля!!!")
}
catch BayCarErrors.wrongEquipment{
    print(BayCarErrors.wrongEquipment.localizedDescription)
}
catch BayCarErrors.wrongСolor {
    print(BayCarErrors.wrongСolor.localizedDescription)
}
catch BayCarErrors.doesNotExist {
    print(BayCarErrors.doesNotExist.localizedDescription)
}
catch BayCarErrors.notEnoughMoney(let needToMoney){
    print(BayCarErrors.notEnoughMoney(needToMoney: needToMoney).localizedDescription)
}
catch BayCarErrors.notAvailability {
    print(BayCarErrors.notAvailability.localizedDescription)
}



