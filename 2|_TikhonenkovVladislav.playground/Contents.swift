import Foundation

print(" 1) Написать функцию, которая определяет, четное число или нет.")

var number = 12

    if number.isMultiple(of: 2){
    print("Число \(number) является четным")
}
else {
    print ("Число \(number) является не четным ")
}

print("")
print(" 2) Написать функцию, которая определяет, делится ли число без остатка на 3. ")

    if number.isMultiple(of: 3){
    print("Число \(number) делится без остатка на 3")
}
else {
    print ("Число \(number) не делится без остатка на 3 ")
}

print("")
print(" 3) Создать возрастающий массив из 100 чисел.")

var intArray = Array(0...99)

print("Cоздаем возрастающий массив из 100 чисел :",intArray)

print("")
print(" 4) Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")

var intArrayFilter : [Int]

// отфильтруем массив первым способом. Удалим все четные числа.
    intArrayFilter = intArray.filter({$0 % 2 != 0 })
    print("Удаляем из массива все четные числа :",intArrayFilter)

// отфильтруем массив вторым способом. Удалим все числа которые не делятся на 3

    for i in intArrayFilter where intArrayFilter[intArrayFilter.firstIndex(of: i)!].isMultiple(of: 3) == false {
        intArrayFilter.remove(at: intArrayFilter.firstIndex(of: i)!)
  }

// Итоговый отфильтрованный массив
print("Удаляем из массива все числа, которые не делятся на 3. Получаем массив ARRAY :",intArrayFilter)

print("")
print(" 5) Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.")

func fibonachi(countArrayFibo : Int) ->[Int]
{
 var fiboArray :[Int] = []
 
 fiboArray.insert(0, at: 0)
 fiboArray.insert(1, at: 1)

 for i in 2 ..< countArrayFibo {
    fiboArray.append(fiboArray[(i-1)] + fiboArray[(i-2)])
    }
    return fiboArray
}

let countFido = 50
let sumArray :[Int]

sumArray = intArrayFilter + fibonachi(countArrayFibo: countFido)

print("Новое чило Фибоначи содержит \(countFido) членов.")
print("Добавляем к нашему массиву ARRAY новое число Фибоначи : ",sumArray)

print("")
print(" 6) Заполнить массив из 100 элементов различными простыми числами. ")
/*
 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
*/

var n = 100
var p = 2
var index = 0
var arrayErat = Array(p...n)
var ind, value, step : Int
var arrayForDel : [Int] = []
var i = 0

print("Исходный массив :",arrayErat)
print("")

repeat {

//  функция для нахождения элемента с шагом р и записи их в отдельный массив для последующего удаления arrayForDel
func delElement (step :Int) -> Int {

    for (ind, _) in arrayErat.enumerated() where ind == step - 1 {
    arrayForDel.append(arrayErat[ind])
}
    return step
}
    step = p
    
    print("Удаляем каждый элемент массива до значения элемента равному  р + 2, т.е  \(p + 2). Последующий шаг удаления р = \(p)")

// удаляем все элементы массива до элемента равного р + 2
    for (ind,value) in arrayErat.enumerated() where value == (p + 2) {
       
        arrayErat.removeFirst(ind)
        break
    }

//  цикл для нахождения всех элементов с шагом р
    arrayForDel = []
    
    for _ in p...n where step < n {
          delElement(step: step)
          step += p
    }
    print("Массив для удаления ", arrayForDel)
    
// удаление всех элементов из основного массива используя массив для удаления arrayForDel
    for i in arrayForDel{
    arrayErat = arrayErat.filter({$0 != i})
}
    print("Актуальный массив ",arrayErat)
    
    n = arrayErat.count
//Находим первое не удалееное число в массиве большее, чем шаг p, и присвоить значению переменной p это число.
    for i in 0 ..< n  {
        if arrayErat[i] > p {
            p = arrayErat[i]
            break
}
}
    print("")
    print("Первое не удаленое число в массиве большее чем р это ",p, " Присваиваем р = ",p)

// Большой цикл/ удаляем соответствующие элементы пока позможно
} while  (p < n) && (p + 2) < n

print("______________________________________________________________________________")
print("Значение шага р больше длинны массива, далее удалаять элименты не возможно !!!")
print("Итоговый отработанный массив : ",arrayErat)
  



