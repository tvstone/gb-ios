import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

//6. Вывести значения свойств экземпляров в консоль.


class Car {
    
    enum WhatHappend : String{

        case engineStarted = " двигатель работает"
        case engineNoStarted = "двигатель не работает"
        case winOpen = "окна открыты"
        case winClose = "окна закрыты"
        
    }

    let marka : String
    let yearOfIssure : Int
    let trunkVolume : Double
    var statusEngine : WhatHappend
    var statusWin : WhatHappend
    var volumeLoadTrunk : Double
    var ostatokTrunk : Double  { //остаток багажника(кузова) после загрузки
        get {
            self.trunkVolume - self.volumeLoadTrunk
        }
    }
 
           init(marka : String,
                yearOfIssure : Int,
                trunkVolume : Double,
                statusEngine : WhatHappend,
                statusWin : WhatHappend,
                volumeLoadTrunk : Double)
           {
    
            self.marka = marka
            self.yearOfIssure = yearOfIssure
            self.trunkVolume = trunkVolume
            self.statusEngine = statusEngine
            self.statusWin = statusWin
            self.volumeLoadTrunk = volumeLoadTrunk
           }
            
    func printVolume() {
      
        print("____________________________________________________")
        print("Модель :", self.marka)
        print("Год производства :",self.yearOfIssure)
        print("Статус двигателя :",self.statusEngine.rawValue)
        print("Статус окон автомобиля :",self.statusWin.rawValue)
    }
    func itog (marka : String) {
        print("_____________________________________________________")
        print("Теперь автомобиль \(marka) имеет следующие характеристики:" )
    }

    func peregruzTrunc(peregruz : Double){
        }
     
    func makeStatus (status : WhatHappend)
    {
        switch status {
        case .engineNoStarted:
            statusEngine = .engineNoStarted
            print("- Двигатель заглушили")
        case .winClose:
            statusWin = .winClose
            print("- Окна закрыли")
        case .engineStarted:
            statusEngine = .engineStarted
            print("- Двигатель запустили")
        case .winOpen:
            statusWin = .winOpen
            print("- Окна открыли")
            }
    }
}

class SportCar : Car {
    
    enum Transmission : String{
        case auto = " автоматическая"
        case mechanical = " механическая"
    }
    enum SeasonWheels : String {
        case winterWheels = "шипованных зимних колес. "
        case summerWheels = "летних колес. "
    }
    
    let clearance : Int
    let transmission : Transmission
    var someWheels : SeasonWheels

    init(marka: String, yearOfIssure: Int, trunkVolume: Double, statusEngine: WhatHappend, statusWin: WhatHappend, volumeLoadTrunk: Double, clearance : Int, transmission : Transmission, someWheels : SeasonWheels) {
             
        self.clearance = clearance
        self.transmission = transmission
        self.someWheels = someWheels
        super.init(marka: marka, yearOfIssure: yearOfIssure, trunkVolume: trunkVolume, statusEngine: statusEngine, statusWin: statusWin, volumeLoadTrunk: volumeLoadTrunk)
    }
    
    override func printVolume() {
        super.printVolume()
        print("Полная вместительность богажника :",self.trunkVolume," килограмм.")
        print("Загруженность багажника :",self.volumeLoadTrunk," килограмм.")
        print("Можно еще загрузить", self.ostatokTrunk," килограмм.")
        print("Клиренс автомобиля составляет \(clearance) мм.")
        print("Трансмиссия автомобиля :\(transmission.rawValue).")
        print("Комплект \(someWheels.rawValue)")
        print("____________________________________________________")
    }
    
    func changeShoesSummer (itSomeWheels : SeasonWheels){
        print("- Меняем комплект колес ")
        someWheels = .summerWheels
    }
    func changeShoesWinter(itSomeWheels: SeasonWheels){
        print("- Меняем комплект колес ")
        someWheels = .winterWheels
    }
    
   override func peregruzTrunc(peregruz : Double)
    {
        print("- Хотим загрузить в богажник",peregruz," килограмм.")
        let peregruz = peregruz + self.volumeLoadTrunk
        guard peregruz > self.trunkVolume else {
                self.volumeLoadTrunk = peregruz
                print("- Загрузили богажник на ",round(peregruz / self.trunkVolume * 100 ), " процентов. Можно загрузить еще : ",self.ostatokTrunk," килограмм")
            return
        }
        print("Не возможно столько загрузить в багажник. Перегруз")
        }
    }
        
class TrunkCar : Car {
    
    enum LoadingType : String{
        case handLoadingType = " погрузочно - разгрузочные работы осуществляются вручную"
        case mechanicaLoadingTypel = " погрузка - разгрузка автомотическая, тип -Самосвал-"
    }
    enum BodyTape : String {
        case tentType = " тент. "
        case termoType = "термо кузов. "
        case metallType = "каркасный металлический."
    }

    let loadingType : LoadingType
    let bodyType : BodyTape
  static var countTrunkCar : Int = 0
    

    init(marka: String, yearOfIssure: Int, trunkVolume: Double, statusEngine: Car.WhatHappend, statusWin: Car.WhatHappend, volumeLoadTrunk: Double, loadingType : LoadingType, bodyType : BodyTape) {
        TrunkCar.countTrunkCar += 1
        self.loadingType = loadingType
        self.bodyType = bodyType
        super.init(marka: marka, yearOfIssure: yearOfIssure, trunkVolume: trunkVolume, statusEngine: statusEngine, statusWin: statusWin, volumeLoadTrunk: volumeLoadTrunk)

    }
       
    override func printVolume() {
        super.printVolume()
        print("Полная вместительность кузова :",self.trunkVolume/1000," тонн.")
        print("Загруженность кузова :",self.volumeLoadTrunk/1000, " тонн.")
        print("Можно еще загрузить", self.ostatokTrunk/1000, " тонн.")
        print("Кузов автомобиля - \(bodyType.rawValue) ")
        print("Тип кузова по виду загрузки :\(loadingType.rawValue).")
        print("Количество грузовиков на стоянке : \(TrunkCar.countTrunkCar)")
        print("____________________________________________________")
    }
    
   override func peregruzTrunc(peregruz : Double)//, cars : KindOfTransport){
     {
         print("- Хотим загрузить в кузов",peregruz/1000," тонн")
        
         let peregruz = peregruz + self.volumeLoadTrunk
         
         guard peregruz > self.trunkVolume else {
            
                 self.volumeLoadTrunk = peregruz
                 print("- Загрузили кузов на ",round(peregruz / self.trunkVolume * 100 ), " процентов. Можно загрузить еще : ",self.ostatokTrunk/1000," тонн")
             return
         }
         print("Не возможно столько загрузить в кузов. Перегруз.")
         }
}
    
    
var car1 = SportCar(marka: "Toyota Camry", yearOfIssure: 2021, trunkVolume: 200, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 20, clearance: 160, transmission: .auto, someWheels: .summerWheels)

var car2 = TrunkCar(marka: "KAMAZ", yearOfIssure: 2020, trunkVolume: 10_000, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 0, loadingType: .mechanicaLoadingTypel, bodyType: .metallType)

var car3 = SportCar(marka: "Honda Pilot", yearOfIssure: 2020, trunkVolume: 300, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 0, clearance: 200, transmission: .auto, someWheels: .winterWheels)
var car4 = TrunkCar(marka: "MAZ", yearOfIssure: 2021, trunkVolume: 15_000, statusEngine: .engineNoStarted, statusWin: .winClose, volumeLoadTrunk: 5000, loadingType: .mechanicaLoadingTypel, bodyType: .metallType)

car1.printVolume()
car1.peregruzTrunc(peregruz: 50)
car1.makeStatus(status: .engineStarted)
car1.makeStatus(status: .winOpen)
car1.changeShoesWinter(itSomeWheels: .winterWheels)
car1.itog(marka: car1.marka)
car1.printVolume()

car2.printVolume()
car2.makeStatus(status: .engineStarted)
car2.makeStatus(status: .winOpen)
car2.peregruzTrunc(peregruz: 6000)
car2.itog(marka: car2.marka)
car2.printVolume()

car3.printVolume()
car3.peregruzTrunc(peregruz: 45)
car3.makeStatus(status: .engineStarted)
car3.makeStatus(status: .winOpen)
car3.changeShoesSummer(itSomeWheels: .summerWheels)
car3.itog(marka: car3.marka)
car3.printVolume()

car4.printVolume()
car4.makeStatus(status: .engineStarted)
car4.makeStatus(status: .winOpen)
car4.peregruzTrunc(peregruz: 3000)
car4.itog(marka: car4.marka)
car4.printVolume()
