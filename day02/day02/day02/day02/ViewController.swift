//
//  ViewController.swift
//  day02
//
//  Created by Harmun Rossouw on 2019/10/10.
//  Copyright © 2019 Harmun Rossouw. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var deathNames: [String] = ["Dan", "Toby", "Jessica"]
    var deathDescriptions: [String] = ["Ooze", "Dragon", "Arrow To The Knee"]
    
     var dataModels = [DataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //traversing through all elements of array

        for i in 0..<self.deathNames.count{

            self.dataModels.append(DataModel(deathName: deathNames[i], deathDescription: deathDescriptions[i]))

            //displaying data in tableview
            self.tableview.reloadData()

        }
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataModels.count
    }
    
    //returns each cell in the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        //getting the hero for the specified position
        let model: DataModel
        
        model = dataModels [indexPath.row]
        
        //displaying values
        cell.DeathName.text = model.deathName
        cell.DeathDescription.text = model.deathDescription
        
        return cell
        
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}

