import UIKit

var str = "Hello, playground"

var dateFormatter = DateFormatter()

dateFormatter.dateStyle = .medium
dateFormatter.timeStyle = .none

let date = NSDate(timeIntervalSinceReferenceDate: 162000)

var formatterDateStr = dateFormatter.string(for: date)
print(formatterDateStr!)

dateFormatter.dateFormat = "yyyy-MM-dd 'at' HH:mm"
formatterDateStr = dateFormatter.string(for: date)
print(formatterDateStr!)

var formatterStr = DateFormatter.dateFormat(fromTemplate: "EdMMM", options: 0, locale: NSLocale.current)
print(formatterStr as Any)
dateFormatter.dateFormat = formatterStr
print(dateFormatter.string(for: NSDate())!)


var numberformatter = NumberFormatter()
numberformatter.numberStyle = .decimal
var formatterNumberStr: String? = numberformatter.string(from: NSNumber(value: 12345.00))
print(formatterNumberStr!)

numberformatter.positiveFormat = "###0.##"
print(numberformatter.string(from: NSNumber(value: 122344.4563))!)

numberformatter.positiveFormat = "0.00%"
print(numberformatter.string(from: NSNumber(value: 4.0))!)

numberformatter.numberStyle = .percent
numberformatter.locale = Locale(identifier: "en_US")
print(numberformatter.string(from: NSNumber(value: 4.0))!)
numberformatter.locale = Locale(identifier: "fa_IR")
print(numberformatter.string(from: NSNumber(value: 4.0))!)




