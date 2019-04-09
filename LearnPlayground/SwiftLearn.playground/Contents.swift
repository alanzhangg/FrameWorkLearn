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







