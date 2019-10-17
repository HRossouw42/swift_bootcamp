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

class ArticleManager {
    
}
