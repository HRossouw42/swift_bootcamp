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
        
        var articleManager = ArticleManager()
        //articleManager.createData()
        //        articleManager.newArticle(title: "Clickbait", content: "OMG HAVE YOU HEARD ABOUT MY MUDKIPS", language: "BORK", image: "PIC OF DOG", creationDate: "1989", modificationDate: "2099")
        //        print("Retrieve Data")
//        articleManager.getAllArticles()
        articleManager.getArticles(containString: "MUDKIPS")
        // let pod = UIApplication.shared.delegate as! AppDelegate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
