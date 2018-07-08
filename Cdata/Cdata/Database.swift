
import Foundation
import UIKit
import CoreData

class DataBase {
    
    static var sharedinstance = DataBase()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func savedata(dict: [String:String]) {
        let stud = NSEntityDescription.insertNewObject(forEntityName: "Students", into: context!) as! Students
        
        stud.fname = dict["fname"]
        stud.lname = dict["lname"]
        stud.email = dict["email"]
        stud.number = dict["number"]

        do{
            try context?.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getData() -> [Students] {
        
        var stud = [Students]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Students")
        do{
            stud = try context?.fetch(fetchReq) as! [Students]
        }catch{
            print(error.localizedDescription)
        }
        return stud
    }
    
    func DeleteData(index: Int) -> [Students] {
        
        var user = getData()
        
        context?.delete(user[index])
        user.remove(at: index)
        do{
            try context?.save()
        }catch{
            print(error.localizedDescription)
        }
        return user
    }
    
    func editData(object:[String:String], i:Int) {
        
        var user = getData()
        user[i].fname = object["fname"]
        user[i].lname = object["lname"]
        user[i].number = object["number"]
        user[i].email = object["email"]

        do {
            try context?.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}


