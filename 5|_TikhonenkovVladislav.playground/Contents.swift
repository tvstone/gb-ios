import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.

enum WhatHappend : String {
    
    case engineStarted = " двигатель работает"
    case engineNoStarted = "двигатель не работает"
    case winOpen = "окна открыты"
    case winClose = "окна закрыты"
    
}

protocol CarProtocol : AnyObject {
    
    
    var marka : String {get}
    var yearOfIssure : Int{get}
    var trunkVolume : Double {get}
    var statusEngine : WhatHappend {get set}
    var statusWin : WhatHappend {get set}
    var peregruz : Double {get set}
    
    
    func peregruzTrunk(peregruz : Double)
    
}

extension CarProtocol {
    
    func makeStatus(status : WhatHappend)  {
        switch status {
        case .engineNoStarted :
            print("- Глушим двигатель.")
            statusEngine = .engineNoStarted
        case .engineStarted :
            print("- Заводим двигатель.")
            statusEngine = .engineStarted
        case .winOpen:
            print("- Открываем окна автомобиля.")
            statusWin = .winOpen
        case .winClose:
            print("- Закрываем окна автомобиля.")
            statusWin = .winClose
        }
    }
    
    func printVolume() {
        print("____________________________________________________")
        print("Модель :", marka)
        print("Год производства :",yearOfIssure)
        
        print("Статус двигателя :",statusEngine.rawValue)
        print("Статус окон автомобиля :",statusWin.rawValue)
    }
    
    func printItog () {
        print("_____________________________________________________")
        print("Теперь автомобиль \(marka) имеет следующие характеристики:" )
    }
    
}

class SportCar : CarProtocol {
    
    enum Transmission : String{
        case auto = " автоматическая"
        case mechanical = " механическая"
    }
    enum SeasonWheels : String {
        case winterWheels = "шипованных зимних колес. "
        case summerWheels = "летних колес. "
    }
    
    var marka: String
    var yearOfIssure: Int
    var trunkVolume: Double
    var statusEngine: WhatHappend
    var statusWin: WhatHappend
    var volumeLoadTrunk : Double
    var ostatokTrunk : Double  { //остаток багажника(кузова) после загрузки
        get {
            trunkVolume - volumeLoadTrunk
        }
    }
    let clearance : Int
    let transmission : Transmission
    var someWheel : SeasonWheels
    var peregruz: Double = 0
    
    init(marka: String, yearOfIssure: Int, trunkVolume: Double, statusEngine: WhatHappend, statusWin: WhatHappend, clearance : Int, transmission : Transmission, someWheel : SeasonWheels, volumeLoadTrunk : Double) {
        
        
        self.marka = marka
        self.yearOfIssure = yearOfIssure
        self.trunkVolume = trunkVolume
        self.statusEngine = statusEngine
        self.statusWin = statusWin
        self.clearance = clearance
        self.transmission = transmission
        self.someWheel = someWheel
        self.volumeLoadTrunk = volumeLoadTrunk

    }
    
    func peregruzTrunk(peregruz : Double){
        
        print("- Хотим загрузить в богажник",peregruz,"килограмм.")
        
        let peregruz = peregruz + self.volumeLoadTrunk
        
        guard peregruz > self.trunkVolume else {
            self.volumeLoadTrunk = peregruz
            print("- Загрузили богажник на",round(peregruz / self.trunkVolume * 100 ),"%. Всего \(peregruz) килограмм.")
            print("- Можно загрузить еще",self.ostatokTrunk,"килограмм.")
            return
        }
        print("Не возможно столько загрузить в багажник. Перегруз")
    }
    
    func changeShoes (itSomeWheels : SeasonWheels){
        
        if itSomeWheels == .summerWheels {
            someWheel = .summerWheels
            print("- Меняем колеса на комплект \(someWheel.rawValue)")
        }
        else{
            someWheel = .winterWheels
            print("- Меняем колеса на комплект \(someWheel.rawValue)")
            
        }
        
    }
    
}


extension SportCar : CustomStringConvertible {
    
    var description: String {
      """
      Клиренс автомобиля \(clearance) мм.
      Каробка передач : \(transmission.rawValue)
      Объем богажника автомобиля  \(trunkVolume) килограмм.
      В багажнике уже загружено  \(volumeLoadTrunk) килограмм.
      Имеется комплект \(someWheel.rawValue)
      
      """
        
    }
    
}


class TrunkCar : CarProtocol {
    
    enum LoadingType : String{
        case handLoadingType = " погрузочно - разгрузочные работы осуществляются вручную"
        case mechanicaLoadingTypel = " погрузка - разгрузка автомотическая, тип -Самосвал-"
    }
    enum BodyTape : String {
        case tentType = " тент. "
        case termoType = "термо кузов. "
        case metallType = "каркасный металлический."
    }
    
    var marka: String
    var yearOfIssure: Int
    var trunkVolume: Double
    var statusEngine: WhatHappend
    var statusWin: WhatHappend
    //  var status: WhatHappend
    var volumeLoadTrunk : Double
    var ostatokTrunk : Double  { //остаток (кузова) после загрузки
        get {
            trunkVolume - volumeLoadTrunk
        }
    }
    let loadingType : LoadingType
    let bodyType : BodyTape
    var peregruz: Double = 0
    static var countTrunkCar : Int = 0
    
    
    init(marka: String, yearOfIssure: Int, trunkVolume: Double, statusEngine: WhatHappend, statusWin: WhatHappend, volumeLoadTrunk: Double, loadingType : LoadingType, bodyType : BodyTape) {
        TrunkCar.countTrunkCar += 1
        self.marka = marka
        self.yearOfIssure = yearOfIssure
        self.trunkVolume = trunkVolume
        self.statusEngine = statusEngine
        self.statusWin = statusWin
        self.volumeLoadTrunk = volumeLoadTrunk
        self.loadingType = loadingType
        self.bodyType = bodyType
        
    }
    
    func peregruzTrunk(peregruz : Double){
        
        print("- Хотим загрузить в кузов грузовика",peregruz/1000,"тонн.")
        
        let peregruz = peregruz + self.volumeLoadTrunk
        
        guard peregruz > self.trunkVolume else {
            self.volumeLoadTrunk = peregruz
            print("- Загрузили кузов на",round(peregruz / self.trunkVolume * 100 ),"%. Всего \(peregruz/1000) тонн.")
            print("- Можно загрузить еще",self.ostatokTrunk/1000,"тонн.")
            return
        }
        print("Не возможно столько загрузить в кузов грузовика. Перегруз")
    }
    
    
}


extension TrunkCar : CustomStringConvertible {
    
    var description: String {
        """
      Тип кузова :\(bodyType.rawValue)
      Тип загрузки:\(loadingType.rawValue)
      Объем кузова грузовика \(trunkVolume/1000) тонн.
      В кузове уже загружено \(volumeLoadTrunk/1000) тонн.
      Количество грузовиков на стоянке \(TrunkCar.countTrunkCar) шт.
      """
        
    }
    
}



var car1 = SportCar.init(marka: "Toyota Camry", yearOfIssure: 2021, trunkVolume: 200, statusEngine: .engineNoStarted, statusWin: .winClose, clearance: 180, transmission: .auto, someWheel: .summerWheels, volumeLoadTrunk: 40)

var car2 = SportCar(marka: "Honda Pilot", yearOfIssure: 2020, trunkVolume: 400, statusEngine: .engineNoStarted, statusWin: .winClose, clearance: 200, transmission: .mechanical, someWheel: .winterWheels, volumeLoadTrunk: 100)

var car3 = TrunkCar(marka: "MAZ", yearOfIssure: 2021, trunkVolume: 15000, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 5000, loadingType: .handLoadingType, bodyType: .tentType)

var car4 = TrunkCar(marka: "KAMAZ", yearOfIssure: 2020, trunkVolume: 20000, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 0, loadingType: .mechanicaLoadingTypel, bodyType: .metallType)


car1.printVolume()
print(car1.description)
car1.peregruzTrunk(peregruz: 50)
car1.makeStatus(status: .engineStarted)
car1.makeStatus(status: .winOpen)
car1.changeShoes(itSomeWheels: .winterWheels)
car1.printItog()
car1.printVolume()
print(car1.description)

car2.printVolume()
print(car2.description)
car2.peregruzTrunk(peregruz: 270)
car2.makeStatus(status: .engineStarted)
car2.makeStatus(status: .winOpen)
car2.changeShoes(itSomeWheels: .summerWheels)
car2.printItog()
car2.printVolume()
print(car2.description)


car3.printVolume()
print(car3.description)
car3.peregruzTrunk(peregruz: 4500)
car3.makeStatus(status: .engineStarted)
car3.makeStatus(status: .winOpen)
car3.printItog()
car3.printVolume()
print(car3.description)

car4.printVolume()
print(car4.description)
car4.peregruzTrunk(peregruz: 8700)
car4.makeStatus(status: .engineStarted)
car4.makeStatus(status: .winOpen)
car4.printItog()
car4.printVolume()
print(car4.description)


