
import Foundation
import UIKit
import CoreData

class data {
    
    static var sharedinstance = data()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func savedata(dict: [String:String]) {
        let stud = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
            
        stud.firstname = dict["fn"]
        stud.lastname = dict["ln"]
        stud.number = dict["num"]
        do{
            try context?.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func getData() -> [User] {
        
        var user = [User]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "User")
        do{
            user = try context?.fetch(fetchReq) as! [User]
        }catch{
            print(error.localizedDescription)
        }
        return user
    }
    
    func DeleteData(index: Int) -> [User] {
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
        user[i].firstname = object["fn"]
        user[i].lastname = object["ln"]
        user[i].number = object["num"]
        
        do {
            try context?.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
}

