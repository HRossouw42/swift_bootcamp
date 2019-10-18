//
//  ArticleManager.swift
//  hrossouw2019
//
//  Created by Harmun Rossouw on 2019/10/18.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import CoreData
import hrossouw2019

  //MARK: - ArticleManager
    class ArticleManager {
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
        
        //MARK: newArticle
        func newArticle(title: String, content: String, language: String, image: String, creationDate: String, modificationDate: String){
            print("Creating article titled: [\(title)]")
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Now let’s create an entity and new user records.
            let userEntity = NSEntityDescription.entity(forEntityName: "CoreData", in: managedContext)!
            
            //final, we need to add some data to our newly created record for each keys using
            
            let articles = NSManagedObject(entity: userEntity, insertInto: managedContext)
            articles.setValue("\(title)", forKeyPath: "title")
            articles.setValue("\(content)", forKey: "content")
            articles.setValue("\(language)", forKey: "language")
            articles.setValue("\(image)", forKey: "image")
            articles.setValue("\(creationDate)", forKey: "creationDate")
            articles.setValue("\(modificationDate)", forKey: "modificationDate")
            
            //Now we have set all the values. The next step is to save them inside the Core Data
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreData")
            fetchRequest.predicate = NSPredicate(format: "title = %@", "Clickbait")
            
            do {
                try managedContext.save()
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreData")
            }
            catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
            print (articles.description)
        }
        
        //MARK: getAllArticles
        public func getAllArticles() {
            
            //As we know that container is set up in the AppDelegates so we need to refer that container.
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Prepare the request of type NSFetchRequest  for the entity
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreData")
            
            // Example search paramaters / limiters
            //        fetchRequest.fetchLimit = 1
            //        fetchRequest.predicate = NSPredicate(format: "title = %@", "Clickbait")
            //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]
            
            do {
                let result = try managedContext.fetch(fetchRequest)
                for data in result as! [NSManagedObject] {
                    print(data.value(forKey: "title") as! String)
                }
                
            } catch {
                print("Failed")
            }
        }
        
        //MARK: getArticles containing String
        public func getArticles(containString str: String) {
            print("Retrieving articles that contain [\(str)]")
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            //We need to create a context from this container
            let managedContext = appDelegate.persistentContainer.viewContext
            
            //Prepare the request of type NSFetchRequest  for the entity
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreData")
            
            //Set request parameters
                    fetchRequest.predicate = NSPredicate(format: "title CONTAINS %@ || content CONTAINS %@", str, str)

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
