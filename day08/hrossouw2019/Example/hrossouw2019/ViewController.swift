//
//  ViewController.swift
//  hrossouw2019
//
//  Created by HRossouw42 on 10/17/2019.
//  Copyright (c) 2019 HRossouw42. All rights reserved.
//

import UIKit
import CoreData
import hrossouw2019

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        printStuff()
        print("Create Data")
        createData()
        print("Retrieve Data")
        retrieveData()
       // let pod = UIApplication.shared.delegate as! AppDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "CoreData", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        
        for i in 1...5 {
            
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue("NewTitleForU\(i)", forKeyPath: "Title")
            user.setValue("MuchContent\(i)@wow", forKey: "Content")
            user.setValue("DoggoBork\(i)", forKey: "Language")
        }

        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
           
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    public func retrieveData() {
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Prepare the request of type NSFetchRequest  for the entity
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreData")
            
    //        fetchRequest.fetchLimit = 1
    //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
    //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
    //
            do {
                let result = try managedContext.fetch(fetchRequest)
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "title") as! String)
                }
                
            } catch {
                
                print("Failed")
            }
        }
    
    /*
    func updateData(){
     
         //As we know that container is set up in the AppDelegates so we need to refer that container.
         guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         
         //We need to create a context from this container
         let managedContext = appDelegate.persistentContainer.viewContext
         
         let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "CoreData")
         fetchRequest.predicate = NSPredicate(format: "Title = %@", "Ankur1")
        /*
         var Title: String?
         var Content: String?
         var Language: String?
         var Image: NSData?
         var Creation: NSDate?
         var Modification: NSDate?
         */
         do
         {
             let test = try managedContext.fetch(fetchRequest)
    
                 let objectUpdate = test[0] as! NSManagedObject
                 objectUpdate.setValue("newTitle", forKey: "Title")
                 objectUpdate.setValue("newContent", forKey: "Content")
                 objectUpdate.setValue("newLanguage", forKey: "Language")
                 do{
                     try managedContext.save()
                 }
                 catch
                 {
                     print(error)
                 }
             }
         catch
         {
             print(error)
         }
    
     }
 */

}


