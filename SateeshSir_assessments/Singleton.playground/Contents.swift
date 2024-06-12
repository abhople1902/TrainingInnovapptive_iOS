import Foundation


class DataManagerClass {
  static let shared = DataManagerClass()
    
  private init() {}
    
  private var studentDictionary: [String: Any] = [:]
    
  func storeData(key: String, value: Any) {
    studentDictionary[key] = value
  }
    
  func retrieveData(key: String) -> Any? {
    return studentDictionary[key]
  }
    
  func printStudentDictionary() {
    print(studentDictionary)
  }
    
}


DataManagerClass.shared.storeData(key: "Name", value: "Ayush Bhople")
DataManagerClass.shared.storeData(key: "age", value: 21)


if let name = DataManagerClass.shared.retrieveData(key: "name") as? String {
  print("Name: \(name)")
}

if let age = DataManagerClass.shared.retrieveData(key: "age") as? Int {
  print("Age: \(age)")
}


DataManagerClass.shared.printStudentDictionary()
