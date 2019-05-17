import UIKit
import Foundation

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog") // less than seven

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

let quotation = """


The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

  "Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."


"""

print(quotation)

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks " \"\"\"
"""
print(threeDoubleQuotationMarks)

// Prints three lines:
let end = """
three
"""

let goodStart = """
one
two

"""
print(goodStart + end)

print(#"6 times 7 is \#(6 * 7)."#)

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

let greetings = "Hello, world!"
let indexs = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

func arithmeticMean(_ numbers: Double...) -> Double { //... array
  var total: Double = 0
  for number in numbers {
    total += number
  }
  return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

func swapTwoInts(_ a: inout Int, _ b: inout Int){
  let temp = a
  a = b
  b = temp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var mathFunction: (inout Int, inout Int) -> () = swapTwoInts

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backword(_ s1: String, _ s2: String) -> Bool{
  return s1 > s2
}
var reverseNames = names.sorted(){ $0 > $1 }

let digitNames = [
  0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
  5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
print(type(of: digitNames))
let numbers = [16, 58, 510]

let strings = numbers.map{ (number) -> String in
  var number = number
  var output = ""
  repeat{
    output = digitNames[number % 10]! + output
    number /= 10
  }while number > 0
  return output
}
print(strings)

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: @autoclosure () -> String){
  print("Now Serving \(customerProvider())")
}

serve(customer: customersInLine.remove(at: 0))

enum CompassPoint: CaseIterable{
  case north
  case south
  case east
  case west
}

enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.east
directionToHead = .north

print("\(CompassPoint.allCases.count) beverages available")

for com in CompassPoint.allCases {
  print(com)
}

enum Barcode{
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode).")
}

indirect enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


@discardableResult
func evaluate(_ expression: ArithmeticExpression) -> Int {
  switch expression {
  case let .number(value):
    return value
  case let .addition(left, right):
    return evaluate(left) + evaluate(right)
  case let .multiplication(left, right):
    return evaluate(left) * evaluate(right)
  }
}

print(evaluate(five))

struct Resolution {
  var width = 0
  var height = 0
}

let hd = Resolution(width: 1920, height: 1080)
var ciname = hd
ciname.width = 2048

print("cinema is now \(ciname.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

struct FixedLengthRange {
  var firstValue: Int
  let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

struct Point {
  var x = 0.0, y = 0.0
}
struct Size {
  var width = 0.0, height = 0.0
}
struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


class StepCounter{
  var totalStep: Int = 0{
    willSet(newTotalStep){
      print("About to set totalSteps to \(newTotalStep)")
    }
    didSet{
      if totalStep > oldValue {
        print("Added \(totalStep - oldValue) steps")
      }
    }
  }
}

let stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 300
stepCounter.totalStep = 895

struct Points {
  var x = 0.0, y = 0.0
  mutating func moveBy(x deltaX: Double, y deltaY: Double) {
    x += deltaX
    y += deltaY
  }
}
var somePoint = Points(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

struct TimesTable{
  let multiplier: Int
  subscript(index: Int) -> Int{
    return multiplier * index
  }
}

let threeTimeTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimeTable[6])")


class Vehicle {
  var currentSpeed = 0.0
  var description: String {
    return "traveling at \(currentSpeed) miles per hour"
  }
  func makeNoise() {
    // do nothing - an arbitrary vehicle doesn't necessarily make a noise
  }
}

let someVehicle = Vehicle()

struct Celsius{
    var temperatureInCelsius: Double
    init(fromFahrenhait fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenhait: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}














