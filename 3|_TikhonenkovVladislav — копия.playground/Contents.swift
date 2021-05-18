import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль


struct SportCars {
    
    enum WhatHappend: String{

        case engineStarted = "Двигатель запущен"
        case engineNoStarted = "Двигатель заглушен"
        case winOpen = "Окна автомобиля открыты"
        case winClose = "Окна автомобиля закрыты"
             
    }
    
    let marka : String
    let yearOfIssure : Int
    var trunkVolume : Double
    var statusEngine : WhatHappend
    var statusWin : WhatHappend
    var volumeLoadTrunk : Double
    var ostatokTrunk : Double {  //остаток багажника после загрузки
        get {
            trunkVolume - volumeLoadTrunk
        }
        
    }
 
    mutating func makeStatus (status : WhatHappend) {
        
        switch status {
 
        case .engineNoStarted:
            statusEngine = .engineStarted
            print("- Двигатель запустили")
        case .winClose:
            statusWin = .winOpen
            print("- Окна открыли")
        
        case .engineStarted:
            statusEngine = .engineNoStarted
            print("- Двигатель заглушили")
        case .winOpen:
            statusWin = .winClose
            print("- Окна закрыли")
                   
            
            }
           
    }
   
    func printSC(){
      
        print("Модель :", self.marka)
        print("Год производства :",self.yearOfIssure)
        print("Объем богажника :",self.trunkVolume)
        print("Статус двигателя :",self.statusEngine.rawValue)
        print("Статус окон автомобиля :",self.statusWin.rawValue)
        print("Загруженность багажника :",self.volumeLoadTrunk)
    }
    
   
    mutating func peregruzTrunc(peregruz : Double, spCars : SportCars) -> Double{
        
        print("- Хотим загрузить в багажник ",peregruz," килограмм.")
        
        let peregruz = peregruz + spCars.volumeLoadTrunk
        if peregruz <= spCars.trunkVolume {
            self.volumeLoadTrunk = peregruz
            print("- Загрузили багажник на ",round(peregruz / spCars.trunkVolume * 100 ), " процентов. Можно загрузить еще : ",self.ostatokTrunk," килограмм")
        }
        else {
            print("Не возможно столько загрузить в багажник.")
       }
       return peregruz
    }
}
    

struct TrunktCars {
    
    enum WhatHappend: String{

        case engineStarted = "Двигатель запущен"
        case engineNoStarted = "Двигатель заглушен"
        case winOpen = "Окна автомобиля открыты"
        case winClose = "Окна автомобиля закрыты"
             
    }
    
    let marka : String
    let yearOfIssure : Int
    var trunkVolume : Double
    var statusEngine : WhatHappend
    var statusWin : WhatHappend
    var volumeLoadTrunk : Double
    var ostatokTrunk : Double {  //остаток багажника после загрузки
        get {
            trunkVolume - volumeLoadTrunk
        }
        
    }
 
    mutating func makeStatus (status : WhatHappend) {
        
        switch status {
 
        case .engineNoStarted:
            statusEngine = .engineStarted
            print("- Двигатель запустили")
        case .winClose:
            statusWin = .winOpen
            print("- Окна открыли")
        
        case .engineStarted:
            statusEngine = .engineNoStarted
            print("- Двигатель заглушили")
        case .winOpen:
            statusWin = .winClose
            print("- Окна закрыли")
                   
            
            }
           
    }
   
    func printSC(){
      
        print("Модель :", self.marka)
        print("Год производства :",self.yearOfIssure)
        print("Объем богажника :",self.trunkVolume)
        print("Статус двигателя :",self.statusEngine.rawValue)
        print("Статус окон автомобиля :",self.statusWin.rawValue)
        print("Загруженность багажника :",self.volumeLoadTrunk)
    }
    
   
    mutating func peregruzTrunc(peregruz : Double, tcCars : TrunktCars) -> Double{
        
        print("- Хотим загрузить в багажник ",peregruz," килограмм.")
        
        let peregruz = peregruz + tcCars.volumeLoadTrunk
        if peregruz <= tcCars.trunkVolume {
            self.volumeLoadTrunk = peregruz
            print("- Загрузили багажник на ",round(peregruz / tcCars.trunkVolume * 100 ), " процентов. Можно загрузить еще : ",self.ostatokTrunk," килограмм")
        }
        else {
            print("Не возможно столько загрузить в багажник.")
       }
       return peregruz
    }
}



var sportCar1 = SportCars(marka: "Toyota Camry",
                          yearOfIssure: 2021,
                          trunkVolume: 60,
                          statusEngine: .engineNoStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 30)

var sportCar2 = SportCars(marka: "Honda",
                          yearOfIssure: 2020,
                          trunkVolume: 62,
                          statusEngine: .engineStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 0)

var sportCar3 = SportCars(marka: "Lexus",
                          yearOfIssure: 2021,
                          trunkVolume: 80,
                          statusEngine: .engineNoStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 60)

var trunkCar1 = TrunktCars(marka: "Белаз",
                          yearOfIssure: 2020,
                          trunkVolume: 7000,
                          statusEngine: .engineNoStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 3000)

var trunkCar2 = TrunktCars(marka: "Камаз",
                          yearOfIssure: 2021,
                          trunkVolume: 6000,
                          statusEngine: .engineNoStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 5000)

var trunkCar3 = TrunktCars(marka: "Man",
                          yearOfIssure: 2021,
                          trunkVolume: 10000,
                          statusEngine: .engineNoStarted,
                          statusWin: .winClose,
                          volumeLoadTrunk: 3000)

print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("Информация по легковым автомобилям")
sportCar1.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
sportCar1.makeStatus(status: .engineNoStarted)
sportCar1.makeStatus(status: .winClose)
sportCar1.peregruzTrunc(peregruz: 20, spCars: sportCar1)
sportCar1.printSC()
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

sportCar2.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
sportCar2.makeStatus(status: .engineStarted)
sportCar2.makeStatus(status: .winClose)
sportCar2.peregruzTrunc(peregruz: 10, spCars: sportCar2)
sportCar2.printSC()
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

sportCar3.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
sportCar3.makeStatus(status: .engineNoStarted)
sportCar3.makeStatus(status: .winClose)
sportCar3.peregruzTrunc(peregruz: 45, spCars: sportCar3)
sportCar3.printSC()

print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
print("Информация по ГРУЗОВЫМ автомобилям")
print("______________________________________________________________________")
trunkCar1.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
trunkCar1.makeStatus(status: .engineNoStarted)
trunkCar1.makeStatus(status: .winClose)
trunkCar1.peregruzTrunc(peregruz: 2000, tcCars: trunkCar1)
trunkCar1.printSC()
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

trunkCar2.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
trunkCar2.makeStatus(status: .engineStarted)
trunkCar2.makeStatus(status: .winClose)
trunkCar2.peregruzTrunc(peregruz: 1000, tcCars: trunkCar2)
trunkCar2.printSC()
print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")

trunkCar3.printSC()
print("=== Провели следующие монипуляции с автомобилем :")
trunkCar3.makeStatus(status: .engineNoStarted)
trunkCar3.makeStatus(status: .winClose)
trunkCar3.peregruzTrunc(peregruz: 4500, tcCars: trunkCar3)
trunkCar3.printSC()



