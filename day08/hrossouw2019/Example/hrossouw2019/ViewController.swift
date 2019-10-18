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
        
        articleManager.newArticle(title: "Clickbait", content: "OMG HAVE YOU HEARD ABOUT MY MUDKIPS", language: "BORK", image: "PIC OF DOG.jpeg", creationDate: "1989", modificationDate: "2099")
                articleManager.newArticle(title: "Doggos Rule OK", content: "Seriously they're great", language: "BORK", image: "PIC OF DOG.jpeg", creationDate: "2001", modificationDate: "2002")
        articleManager.newArticle(title: "Cats are the best", content: "OMG HAVE YOU HEARD ABOUT MY CATS", language: "MAUW", image: "PIC OF CAT.jpeg", creationDate: "1989", modificationDate: "2099")

        articleManager.getAllArticles()
        print("\n")
        articleManager.getArticles(containString: "MUDKIPS")
        print("\n")
        articleManager.getArticles(withLang: "BORK")
        print("\n")
        
        articleManager.removeArticle(title: "Clickbait")
        articleManager.removeArticle(title: "Cats are the best")

        articleManager.getAllArticles()
        print("\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
