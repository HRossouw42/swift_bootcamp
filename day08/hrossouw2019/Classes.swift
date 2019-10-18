//
//  Classes.swift
//  hrossouw2019
//
//  Created by Harmun Rossouw on 2019/10/17.
//

import Foundation
import CoreData
import UIKit

public func printStuff() {
    print("OMG MY POD LOADS")
}

class Article: NSManagedObject {
    var Title: String?
    var Content: String?
    var Language: String?
    var Image: NSData?
    var Creation: NSDate?
    var Modification: NSDate?
    
//    init(event:[String:Any]){
//        self.Title =
//    }
    
    override var description: String {
        return ("Article title: \(self.Title)")
    }
}

//class ArticleManager {
//    func createData(){
//
//           //As we know that container is set up in the AppDelegates so we need to refer that container.
//           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//
//           //We need to create a context from this container
//           let managedContext = appDelegate.persistentContainer.viewContext
//
//           //Now let’s create an entity and new user records.
//           let userEntity = NSEntityDescription.entity(forEntityName: "CoreData", in: managedContext)!
//
//           //final, we need to add some data to our newly created record for each keys using
//           //here adding 5 data with loop
//
//           for i in 1...5 {
//
//               let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
//               user.setValue("NewTitleForU\(i)", forKeyPath: "Title")
//               user.setValue("MuchContent\(i)@wow", forKey: "Content")
//               user.setValue("DoggoBork\(i)", forKey: "Language")
//           }
//
//           //Now we have set all the values. The next step is to save them inside the Core Data
//
//           do {
//               try managedContext.save()
//
//           } catch let error as NSError {
//               print("Could not save. \(error), \(error.userInfo)")
//           }
//       }
//}
