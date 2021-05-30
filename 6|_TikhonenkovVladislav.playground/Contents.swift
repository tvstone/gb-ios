import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

// Описываем конвейер на котором изготавливаются разлиные гвозди

enum Material : String {
    
    case iron = "железный"
    case cuprum = "медный"
    case aluminum = "аллюминиевый"
}

class Nails {
    let material : Material
    let size :(Int, Int)
    let weight : Double
    var inStock : Bool
    
    
    init(material : Material, size: (Int, Int), weight : Double, inStock : Bool) {
        self.material = material
        self.size = size
        self.weight = weight
        self.inStock = inStock
        
    }
    
}

extension Nails {
    
    var printVolue : String {
        """
        _________________________________________________
        Гвоздь \(material.rawValue). Размер \(size.0)х\(size.1).
        """
    }
}

struct Queue<MyType>{
    
    var elements : [MyType] = []
    mutating func push ( _ element : MyType){
        elements.append(element)
    }
    mutating func pop() -> MyType? {
        guard elements.count > 0  else {
            print(" На конвейере больше нет гвоздей.")
            return nil
        }
        return elements.removeFirst()
    }
    subscript (index : Int) ->MyType? {
        
        guard index < elements.count else {
            return nil
        }
        return elements[index]
        
    }
    
}


func printEnd(){
    print("**************************************************************")
}


var ints = Queue<Nails>()


ints.push(Nails(material: .iron, size: (50,5), weight: 20, inStock: true))
ints.push(Nails(material: .iron, size: (60,5), weight: 30, inStock: true))
ints.push(Nails(material: .aluminum, size: (50,5), weight: 20, inStock: true))
ints.push(Nails(material: .iron, size: (50,5), weight: 20, inStock: true))
ints.push(Nails(material: .cuprum, size: (50,5), weight: 20, inStock: false))
ints.push(Nails(material: .iron, size: (60,5), weight: 30, inStock: true))
ints.push(Nails(material: .aluminum, size: (60,5), weight: 30, inStock: true))
ints.push(Nails(material: .iron, size: (50,5), weight: 20, inStock: true))
ints.push(Nails(material: .cuprum, size: (50,5), weight: 20, inStock: true))
ints.push(Nails(material: .iron, size: (70,5), weight: 40, inStock: false))


printEnd()
print("Всего изделий находящихся на конвейере: " + String(ints.elements.count))
printEnd()
ints.elements.forEach{print($0.printVolue)}

var filteredInStock = ints.elements.filter({$0.inStock == true})
printEnd()
print("Количество единиц изделий промаркировано:" + String(filteredInStock.count) + " шт.")
printEnd()
filteredInStock.forEach {print($0.printVolue)}

filteredInStock = ints.elements.filter({$0.material == Material.iron})
printEnd()
print("Количество единиц изделий изготвленных из железа :" + String(filteredInStock.count) + " шт.")
printEnd()
filteredInStock.forEach {print($0.printVolue)}

filteredInStock = ints.elements.filter({$0.weight > 20})
printEnd()
print("Количество единиц изделий вес которых больще 20 грамм :" + String(filteredInStock.count) + " шт.")
printEnd()
filteredInStock.forEach {print($0.printVolue)}

printEnd()
print("Обращаемся к 9 му элементу очереди:")
print(ints[9-1]?.printVolue  ?? "Такого элемента нет.")// так как номерация начинается с 0
printEnd()
print("Обращаемся к 11 му элементу очереди:")
print(ints[11-1]?.printVolue  ?? "Такого элемента нет.")// так как номерация начинается с 0

ints.pop()
ints.pop()
printEnd()
print("С конвейера вышли первые два изделия.")
printEnd()
print("Теперь всего изделий находящихся на конвейере: " + String(ints.elements.count))
printEnd()
ints.elements.forEach{print($0.printVolue)}
